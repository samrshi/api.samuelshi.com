import Fluent
import FluentSQLiteDriver
import Testing
import VaporTesting
@testable import App

@Suite("Post Tests", .serialized)
struct PostTests {
    let pidA = "123456789"
    let pidB = "987654321"
    let pidC = "657483920"
    
    let communityAID = UUID()
    let communityBID = UUID()
    
    func makeCommunityA() -> CommunityModel {
        CommunityModel(
            id: communityAID,
            creatorPID: "123456789",
            communityCode: "A",
            name: "A",
            hexColor: "A",
            sfSymbolName: "A"
        )
    }
    
    @Test
    func testGetPostsEmptyCommunity() async throws {
        let community = makeCommunityA()
        
        try await testEndpoint(.GET, "nicknack/communities/\(communityAID)/posts") { req, db in
            try await community.create(on: db)
            req.bearerToken = pidA
        } afterResponse: { res, db in
            #expect(res.status == .ok)
            
            let posts = try res.content.decode([PostContent].self)
            #expect(posts == [])
        }
    }
    
    @Test
    func testGetPostsNotMember() async throws {
        let community = makeCommunityA()
        
        try await testEndpoint(.GET, "nicknack/communities/\(communityAID)/posts") { req, db in
            try await community.create(on: db)
            req.bearerToken = pidB
        } afterResponse: { res, db in
            #expect(res.status == .unauthorized)
        }
    }
    
    @Test
    func testGetPostsBadCommunity() async throws {
        let community = makeCommunityA()
        
        try await testEndpoint(.GET, "nicknack/communities/\(UUID())/posts") { req, db in
            try await community.create(on: db)
            req.bearerToken = pidB
        } afterResponse: { res, db in
            #expect(res.status == .notFound)
        }
    }
    
    @Test
    func testGetPostsAsCreator() async throws {
        let community = makeCommunityA()
        let postX = PostModel(contents: "X", creatorPID: pidA)
        let postY = PostModel(contents: "Y", creatorPID: pidA)
        
        try await testEndpoint(.GET, "nicknack/communities/\(communityAID)/posts") { req, db in
            req.bearerToken = pidA
            
            try await community.create(on: db)
            try await community.$posts.create(postX, on: db)
            try await community.$posts.create(postY, on: db)
        } afterResponse: { res, db in
            #expect(res.status == .ok)
            
            let posts = try res.content.decode([PostContent].self)
            let expected = try await [postY, postX].asyncMap { try await $0.content(db: db, userPID: pidA) }
            #expect(posts == expected)
        }
    }
    
    @Test
    func testGetPostsAsMember() async throws {
        let community = makeCommunityA()
        let postX = PostModel(contents: "X", creatorPID: pidA)
        let postY = PostModel(contents: "Y", creatorPID: pidA)
        
        let membershipB = CommunityMemberModel(userPID: pidB)
        
        try await testEndpoint(.GET, "nicknack/communities/\(communityAID)/posts") { req, db in
            req.bearerToken = pidB
            
            try await community.create(on: db)
            
            try await community.$members.create(membershipB, on: db)
            try await community.$posts.create(postX, on: db)
            try await community.$posts.create(postY, on: db)
        } afterResponse: { res, db in
            #expect(res.status == .ok)
            
            let posts = try res.content.decode([PostContent].self)
            #expect(posts.map { $0.contents } == ["Y", "X"] )
            #expect(posts.map { $0.userIsCreator } == [false, false] )
        }
    }
    
    @Test
    func testGetPostsWithVotes() async throws {
        let community = makeCommunityA()
        
        let postX = PostModel(contents: "X", creatorPID: pidA)
        let voteX1 = VoteModel(creatorPID: pidA, direction: 1)
        let voteX2 = VoteModel(creatorPID: pidB, direction: 1)
        let voteX3 = VoteModel(creatorPID: pidC, direction: -1)

        let postY = PostModel(contents: "Y", creatorPID: pidB)
        let voteY1 = VoteModel(creatorPID: pidA, direction: 1)
        let voteY2 = VoteModel(creatorPID: pidB, direction: -1)
        let voteY3 = VoteModel(creatorPID: pidC, direction: -1)
        
        let postZ = PostModel(contents: "Z", creatorPID: pidC)
        let voteZ1 = VoteModel(creatorPID: pidA, direction: 1)
        let voteZ3 = VoteModel(creatorPID: pidC, direction: 1)

        let membershipB = CommunityMemberModel(userPID: pidB)
        let membershipC = CommunityMemberModel(userPID: pidC)
        
        try await testEndpoint(.GET, "nicknack/communities/\(communityAID)/posts") { req, db in
            req.bearerToken = pidB
            
            try await community.create(on: db)
            
            try await community.$members.create(membershipB, on: db)
            try await community.$members.create(membershipC, on: db)
            
            try await community.$posts.create(postX, on: db)
            try await postX.$votes.create(voteX1, on: db)
            try await postX.$votes.create(voteX2, on: db)
            try await postX.$votes.create(voteX3, on: db)
            
            try await community.$posts.create(postY, on: db)
            try await postY.$votes.create(voteY1, on: db)
            try await postY.$votes.create(voteY2, on: db)
            try await postY.$votes.create(voteY3, on: db)
            
            try await community.$posts.create(postZ, on: db)
            try await postZ.$votes.create(voteZ1, on: db)
            try await postZ.$votes.create(voteZ3, on: db)
        } afterResponse: { res, db in
            #expect(res.status == .ok)
            let posts = try res.content.decode([PostContent].self)
            
            let netVotes = posts.map { $0.netVotes }
            #expect(netVotes == [2, -1, 1])
            
            let hasUpvoted = posts.map { $0.userHasUpvoted }
            #expect(hasUpvoted == [false, false, true])
            
            let hasDownvoted = posts.map { $0.userHasDownvoted }
            #expect(hasDownvoted == [false, true, false])
        }
    }
    
    @Test
    func testCreatePost() async throws {
        let community = makeCommunityA()
        let newPost = NewPostContent(contents: "New!")
        
        try await testEndpoint(.POST, "nicknack/communities/\(communityAID)/posts") { req, db in
            req.bearerToken = pidA
            try req.content.encode(newPost)
            
            try await community.create(on: db)
        } afterResponse: { res, db in
            #expect(res.status == .ok)
            
            let post = try res.content.decode(PostContent.self)
            #expect(post.contents == "New!")
            #expect(post.userIsCreator == true)
            
            let posts = try await community.$posts
                .get(on: db)
                .map { $0.contents }
            
            #expect(posts == ["New!"])
        }
    }
    
    @Test
    func testDeletePost() async throws {
        let community = makeCommunityA()
        
        let postAID = UUID()
        let postA = PostModel(id: postAID, contents: "A", creatorPID: pidA)
        let voteA = VoteModel(creatorPID: pidA, direction: 1)
        
        let postBID = UUID()
        let postB = PostModel(id: postBID, contents: "B", creatorPID: pidA)
        let voteB = VoteModel(creatorPID: pidB, direction: 1)
        
        try await testEndpoint(.DELETE, "nicknack/communities/\(communityAID)/posts/\(postAID)") { req, db in
            req.bearerToken = pidA
            
            try await community.create(on: db)
            
            try await community.$posts.create(postA, on: db)
            try await community.$posts.create(postB, on: db)
            
            try await postA.$votes.create(voteA, on: db)
            try await postB.$votes.create(voteB, on: db)
        } afterResponse: { res, db in
            #expect(res.status == .noContent)
            
            let posts = try await PostModel.query(on: db).all().map { $0.contents }
            #expect(posts == ["B"])
            
            let votes = try await VoteModel.query(on: db).all().map { $0.creatorPID }
            #expect(votes == [pidB])
        }
    }
    
    @Test
    func testDeletePostNotFound() async throws {
        let community = makeCommunityA()
        
        let postAID = UUID()
        let postA = PostModel(id: postAID, contents: "A", creatorPID: pidA)
        let voteA = VoteModel(creatorPID: pidA, direction: 1)
        
        try await testEndpoint(.DELETE, "nicknack/communities/\(communityAID)/posts/\(UUID())") { req, db in
            req.bearerToken = pidA
            
            try await community.create(on: db)
            
            try await community.$posts.create(postA, on: db)
            try await postA.$votes.create(voteA, on: db)
        } afterResponse: { res, db in
            #expect(res.status == .notFound)
            
            let posts = try await PostModel.query(on: db).all().map { $0.contents }
            #expect(posts == ["A"])
            
            let votes = try await VoteModel.query(on: db).all().map { $0.creatorPID }
            #expect(votes == [pidA])
        }
    }
    
    @Test
    func testDeletePostNotAuthorized() async throws {
        let community = makeCommunityA()
        
        let postAID = UUID()
        let postA = PostModel(id: postAID, contents: "A", creatorPID: pidA)
        let voteA = VoteModel(creatorPID: pidA, direction: 1)
        
        let membershipB = CommunityMemberModel(userPID: pidB)
        
        try await testEndpoint(.DELETE, "nicknack/communities/\(communityAID)/posts/\(postAID)") { req, db in
            req.bearerToken = pidB
            
            try await community.create(on: db)
            
            try await community.$members.create(membershipB, on: db)
            try await community.$posts.create(postA, on: db)
            try await postA.$votes.create(voteA, on: db)
        } afterResponse: { res, db in
            #expect(res.status == .unauthorized)
            
            let posts = try await PostModel.query(on: db).all().map { $0.contents }
            #expect(posts == ["A"])
            
            let votes = try await VoteModel.query(on: db).all().map { $0.creatorPID }
            #expect(votes == [pidA])
        }
    }
    
    @Test
    func testVoteNoDirection() async throws {
        let community = makeCommunityA()
        
        let postID = UUID()
        let post = PostModel(id: postID, contents: "A", creatorPID: pidA)

        try await testEndpoint(.PUT, "nicknack/communities/\(communityAID)/posts/\(postID)/vote") { req, db in
            req.bearerToken = pidA
            
            try await community.create(on: db)
            try await community.$posts.create(post, on: db)
        } afterResponse: { res, db in
            #expect(res.status == .badRequest)
            
            let votes = try await VoteModel.query(on: db).all()
            #expect(votes == [])
        }
    }
    
    @Test
    func testVoteBadDirection() async throws {
        let community = makeCommunityA()
        
        let postID = UUID()
        let post = PostModel(id: postID, contents: "A", creatorPID: pidA)

        try await testEndpoint(.PUT, "nicknack/communities/\(communityAID)/posts/\(postID)/vote") { req, db in
            try req.content.encode("{ \"direction\": \"bad\" }")
            req.bearerToken = pidA
            req.headers.contentType = .json

            try await community.create(on: db)
            try await community.$posts.create(post, on: db)
        } afterResponse: { res, db in
            #expect(res.status == .badRequest)
            
            let votes = try await VoteModel.query(on: db).all()
            #expect(votes == [])
        }
    }
    
    @Test(arguments: [VoteDirection.up, VoteDirection.down, VoteDirection.none])
    func testVoteNew(direction: VoteDirection) async throws {
        let community = makeCommunityA()
        
        let postID = UUID()
        let post = PostModel(id: postID, contents: "A", creatorPID: pidA)

        try await testEndpoint(.PUT, "nicknack/communities/\(communityAID)/posts/\(postID)/vote") { req, db in
            try req.content.encode("{ \"direction\": \"\(direction.jsonValue)\" }")
            req.bearerToken = pidA
            req.headers.contentType = .json

            try await community.create(on: db)
            try await community.$posts.create(post, on: db)
        } afterResponse: { res, db in
            #expect(res.status == .ok)
            
            let votes = try await post.$votes.get(on: db)
            
            #expect(votes.map { $0.creatorPID } == [pidA])
            #expect(votes.map { $0.direction } == [direction.effectValue])
        }
    }
    
    @Test(arguments: [VoteDirection.up, VoteDirection.down, VoteDirection.none], [VoteDirection.up, VoteDirection.down, VoteDirection.none])
    func testVoteNew(initialDirection: VoteDirection, newDirection: VoteDirection) async throws {
        let community = makeCommunityA()
        
        let postID = UUID()
        let post = PostModel(id: postID, contents: "A", creatorPID: pidA)

        try await testEndpoint(.PUT, "nicknack/communities/\(communityAID)/posts/\(postID)/vote") { req, db in
            try req.content.encode("{ \"direction\": \"\(newDirection.jsonValue)\" }")
            req.bearerToken = pidA
            req.headers.contentType = .json

            try await community.create(on: db)
            try await community.$posts.create(post, on: db)
        } afterResponse: { res, db in
            #expect(res.status == .ok)
            
            let votes = try await post.$votes.get(on: db)
            
            #expect(votes.map { $0.creatorPID } == [pidA])
            #expect(votes.map { $0.direction } == [newDirection.effectValue])
        }
    }
}
