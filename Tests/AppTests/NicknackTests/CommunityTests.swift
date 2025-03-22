import Fluent
import FluentSQLiteDriver
import Testing
import VaporTesting
@testable import App

@Suite("Community Tests", .serialized)
struct CommunityTests {
    let pidA = "123456789"
    let pidB = "987654321"
    let pidC = "657483920"
    
    @Test
    func testNoAPIKey() async throws {
        try await testEndpoint(.GET, "nicknack", "communities") { _, _ in
        } afterResponse: { res, _ in
            #expect(res.status == .badRequest)
        }
    }
    
    @Test
    func testBadAPIKey() async throws {
        try await testEndpoint(.GET, "nicknack", "communities") { req, _ in
            req.bearerToken = "bad"
        } afterResponse: { res, _ in
            #expect(res.status == .unauthorized)
        }
    }
    
    @Test
    func testGetCommunitiesNone() async throws {
        let community = CommunityModel(creatorPID: pidB, communityCode: "0", name: "0", hexColor: "0", sfSymbolName: "0")
        
        try await testEndpoint(.GET, "nicknack", "communities") { req, db in
            try await community.create(on: db)
            req.bearerToken = pidA
        } afterResponse: { res, db in
            #expect(res.status == .ok)
            
            let communities = try res.content.decode([CommunityContent].self)
            #expect(communities == [])
        }
    }
    
    @Test
    func testGetCommunitiesJoinedAndCreated() async throws {
        let communityA = CommunityModel(creatorPID: pidA, communityCode: "A", name: "A", hexColor: "A", sfSymbolName: "A")
        let communityB = CommunityModel(creatorPID: pidB, communityCode: "B", name: "B", hexColor: "B", sfSymbolName: "B")
        let membershipA = CommunityMemberModel(userPID: pidA)
        
        try await testEndpoint(.GET, "nicknack", "communities") { req, db in
            try await communityA.create(on: db)
            try await communityB.create(on: db)
            try await communityB.$members.create(membershipA, on: db)
            req.bearerToken = pidA
        } afterResponse: { res, _ in
            #expect(res.status == .ok)
            
            let actual = try res.content.decode([CommunityContent].self)
            let expected = try [communityA.content(), communityB.content()]
            #expect(actual == expected)
        }
    }
    
    @Test
    func testCreateCommunity() async throws {
        let newCommunity = NewCommunityContent(name: "Roommates", hexColor: "ff0000", sfSymbolName: "sun.max")
        
        try await testEndpoint(.POST, "nicknack", "communities") { req, db in
            req.bearerToken = pidB
            try req.content.encode(newCommunity)
        } afterResponse: { res, db in
            #expect(res.status == .ok)
            
            let communities = try await CommunityModel.query(on: db)
                .all()
                .map { try $0.content() }
            
            #expect(communities.map { $0.name } == [newCommunity.name])
        }
    }
    
    @Test
    func testDeleteCommunity() async throws {
        let communityID = UUID()
        let community = CommunityModel(id: communityID, creatorPID: pidA, communityCode: "A", name: "A", hexColor: "A", sfSymbolName: "A")
        
        try await testEndpoint(.DELETE, "nicknack", "communities", communityID.uuidString) { req, db in
            req.bearerToken = pidA
            try await community.create(on: db)
        } afterResponse: { res, db in
            #expect(res.status == .noContent)
            
            let communities = try await CommunityModel.query(on: db).all()
            #expect(communities.isEmpty)
        }
    }
    
    @Test
    func testDeleteCommunityNotFound() async throws {
        let communityID = UUID()
        
        try await testEndpoint(.DELETE, "nicknack", "communities", communityID.uuidString) { req, db in
            req.bearerToken = pidA
        } afterResponse: { res, db in
            #expect(res.status == .notFound)
        }
    }
    
    @Test
    func testDeleteCommunityUnauthorized() async throws {
        let communityID = UUID()
        let community = CommunityModel(id: communityID, creatorPID: pidB, communityCode: "B", name: "B", hexColor: "B", sfSymbolName: "B")
        
        try await testEndpoint(.DELETE, "nicknack", "communities", communityID.uuidString) { req, db in
            req.bearerToken = pidA
            try await community.create(on: db)
        } afterResponse: { res, db in
            #expect(res.status == .unauthorized)
        }
    }
    
    @Test
    func testDeleteCommunityCascade() async throws {
        let communityID = UUID()
        let community = CommunityModel(id: communityID, creatorPID: pidA, communityCode: "A", name: "A", hexColor: "A", sfSymbolName: "A")
        
        let post = PostModel(contents: "A", creatorPID: pidA)
        let membershipB = CommunityMemberModel(userPID: pidB)
        
        try await testEndpoint(.DELETE, "nicknack", "communities", communityID.uuidString) { req, db in
            req.bearerToken = pidA
            try await community.create(on: db)
            try await community.$posts.create(post, on: db)
            try await community.$members.create(membershipB, on: db)
        } afterResponse: { res, db in
            #expect(res.status == .noContent)
            
            let communities = try await CommunityModel.query(on: db).all()
            #expect(communities.isEmpty)
            
            let posts = try await PostModel.query(on: db).all()
            #expect(posts.isEmpty)
            
            let memberships = try await CommunityMemberModel.query(on: db).all()
            #expect(memberships.isEmpty)
        }
    }

    @Test
    func testChangeMembershipNotFound() async throws {
        try await testEndpoint(.PUT, "nicknack/communities/\(UUID())/membership") { req, db in
            req.bearerToken = pidA
        } afterResponse: { res, db in
            #expect(res.status == .notFound)
            
            let count = try await CommunityMemberModel.query(on: db).count().get()
            #expect(count == 0)
        }
    }
    
    @Test
    func testChangeMembershipNoDirection() async throws {
        let communityID = UUID()
        let community = CommunityModel(id: communityID, creatorPID: pidB, communityCode: "B", name: "B", hexColor: "B", sfSymbolName: "B")
        
        try await testEndpoint(.PUT, "nicknack/communities/\(communityID)/membership") { req, db in
            req.bearerToken = pidA
            
            try await community.create(on: db)
        } afterResponse: { res, db in
            #expect(res.status == .badRequest)
            #expect(res.content["reason"] == "Must provide direction (join or leave).")
            
            let count = try await CommunityMemberModel.query(on: db).count().get()
            #expect(count == 0)
        }
    }
    
    @Test
    func testChangeMembershipBadDirection() async throws {
        let communityID = UUID()
        let community = CommunityModel(id: communityID, creatorPID: pidB, communityCode: "B", name: "B", hexColor: "B", sfSymbolName: "B")
        
        try await testEndpoint(.PUT, "nicknack/communities/\(communityID)/membership") { req, db in
            try req.content.encode("{ \"direction\": \"bad\" }")
            req.bearerToken = pidA
            req.headers.contentType = .json
            
            try await community.create(on: db)
        } afterResponse: { res, db in
            #expect(res.status == .badRequest)
            #expect(res.content["reason"] == "Direction must be either join or leave.")
            
            let count = try await CommunityMemberModel.query(on: db).count().get()
            #expect(count == 0)
        }
    }
    
    @Test
    func testChangeMembershipJoin() async throws {
        let communityID = UUID()
        let community = CommunityModel(id: communityID, creatorPID: pidB, communityCode: "B", name: "B", hexColor: "B", sfSymbolName: "B")

        try await testEndpoint(.PUT, "nicknack/communities/\(communityID)/membership") { req, db in
            try req.content.encode("{ \"direction\": \"join\" }")
            req.bearerToken = pidA
            req.headers.contentType = .json
            
            try await community.create(on: db)
        } afterResponse: { res, db in
            #expect(res.status == .ok)
            
            let joinedCommunities = try await CommunityMemberModel.query(on: db)
                .filter(\.$userPID == pidA)
                .all()
                .map { $0.$community.id }
            #expect(joinedCommunities == [communityID])
            
            let communityMembers = try await community.$members.get(on: db)
                .map { $0.userPID }
            #expect(communityMembers == [pidA])
        }
    }
    
    @Test
    func testChangeMembershipJoinRedundant() async throws {
        let communityID = UUID()
        let community = CommunityModel(id: communityID, creatorPID: pidB, communityCode: "B", name: "B", hexColor: "B", sfSymbolName: "B")
        let membershipA = CommunityMemberModel(userPID: pidA)
        
        try await testEndpoint(.PUT, "nicknack/communities/\(communityID)/membership") { req, db in
            try req.content.encode("{ \"direction\": \"join\" }")
            req.bearerToken = pidA
            req.headers.contentType = .json
            
            try await community.create(on: db)
            try await community.$members.create(membershipA, on: db)
        } afterResponse: { res, db in
            #expect(res.status == .ok)
            
            let joinedCommunities = try await CommunityMemberModel.query(on: db)
                .filter(\.$userPID == pidA)
                .all()
                .map { $0.$community.id }
            #expect(joinedCommunities == [communityID])
            
            let communityMembers = try await community.$members.get(on: db)
                .map { $0.userPID }
            #expect(communityMembers == [pidA])
        }
    }
    
    @Test
    func testChangeMembershipLeave() async throws {
        let community1ID = UUID()
        let community2ID = UUID()
        let community1 = CommunityModel(id: community1ID, creatorPID: pidB, communityCode: "B", name: "B", hexColor: "B", sfSymbolName: "B")
        let community2 = CommunityModel(id: community2ID, creatorPID: pidB, communityCode: "B2", name: "B2", hexColor: "B2", sfSymbolName: "B2")
        
        let membershipA1 = CommunityMemberModel(userPID: pidA)
        let membershipA2 = CommunityMemberModel(userPID: pidA)
        let membershipC1 = CommunityMemberModel(userPID: pidC)
        
        try await testEndpoint(.PUT, "nicknack/communities/\(community1ID)/membership") { req, db in
            try req.content.encode("{ \"direction\": \"leave\" }")
            req.bearerToken = pidA
            req.headers.contentType = .json
            
            try await community1.create(on: db)
            try await community1.$members.create(membershipA1, on: db)
            try await community1.$members.create(membershipC1, on: db)
            
            try await community2.create(on: db)
            try await community2.$members.create(membershipA2, on: db)
        } afterResponse: { res, db in
            #expect(res.status == .ok)
            
            let joinedCommunities = try await CommunityMemberModel.query(on: db)
                .filter(\.$userPID == pidA)
                .all()
                .map { $0.$community.id }
            #expect(joinedCommunities == [community2ID])
            
            let communityMembers = try await community1.$members.get(on: db)
                .map { $0.userPID }
            #expect(communityMembers == [pidC])
        }
    }
}
