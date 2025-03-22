//
//  PostRoutes.swift
//  api
//
//  Created by Samuel Shi on 3/20/25.
//

import Fluent
import Vapor

struct PostRoutes: RouteCollection {
    func boot(routes posts: any RoutesBuilder) throws {
        posts.get { try await getPosts(request: $0) }
        posts.post { try await createPost(request: $0) }
        
        posts.group(":post-id") { post in
            post.delete { try await deletePost(request: $0) }
            post.put("vote") { try await vote(request: $0) }
        }
    }
    
    // Sorted by timestamp. Newest first
    private func getPosts(request: Request) async throws -> [PostContent] {
        let user = try request.auth.require(PIDUser.self)
        let community = try await readCommunity(for: request, user: user)
        
        return try await community.$posts
            .query(on: request.db)
            .sort(\.$timestamp, .descending)
            .all()
            .asyncMap { try await $0.content(db: request.db, userPID: user.pid) }
    }
    
    private func createPost(request: Request) async throws -> PostContent {
        let user = try request.auth.require(PIDUser.self)
        let community = try await readCommunity(for: request, user: user)
        
        let new = try request.content.decode(NewPostContent.self)
        let model = PostModel(creatorPID: user.pid, new: new)
        
        try await community.$posts.create(model, on: request.db)
        return try await model.content(db: request.db, userPID: user.pid)
    }
    
    private func deletePost(request: Request) async throws -> HTTPStatus {
        let user = try request.auth.require(PIDUser.self)
        let post = try await readPost(for: request, user: user)
        
        guard post.creatorPID == user.pid else {
            throw Abort(.unauthorized, reason: "Posts can only be deleted by their creators.")
        }
        
        try await post.delete(on: request.db)
        return .noContent
    }
    
    private func vote(request: Request) async throws -> HTTPStatus {
        
        let user = try request.auth.require(PIDUser.self)
        let post = try await readPost(for: request, user: user)

        guard let rawDirection: String? = request.content["direction"] else {
            throw Abort(.badRequest, reason: "Must provide a direction (up, down, null).")
        }
        
        guard let direction = VoteDirection(string: rawDirection) else {
            throw Abort(.badRequest, reason: "Invalid direction. Must be up, down, or null.")
        }
        
        let existingVote = try await post.$votes
            .query(on: request.db)
            .filter(\.$creatorPID == user.pid)
            .first()

        if let existingVote {
            existingVote.direction = direction.effectValue
            try await existingVote.update(on: request.db)
        } else {
            let vote = VoteModel(creatorPID: user.pid, direction: direction.effectValue)
            try await post.$votes.create(vote, on: request.db)
        }
        
        return .ok
    }
}

extension PostRoutes {
    private func readCommunity(for request: Request, user: PIDUser) async throws -> CommunityModel {
        let communityID: UUID? = request.parameters.get("community-id")
        let community = try await CommunityModel.find(communityID, on: request.db)
        
        guard let community else {
            throw Abort(.notFound, reason: "Community not found.")
        }
        
        let isCreator = community.creatorPID == user.pid
        
        let isMember = try await community.$members
            .query(on: request.db)
            .filter(\.$userPID == user.pid)
            .count() > 0
        
        guard isCreator || isMember else {
            throw Abort(.unauthorized, reason: "You are not a member of this community.")
        }
        
        return community
    }
    
    private func readPost(for request: Request, user: PIDUser) async throws -> PostModel {
        let community = try await readCommunity(for: request, user: user)
        
        let postID: UUID = try request.parameters.require("post-id")
        let post = try await community.$posts
            .query(on: request.db)
            .filter(\.$id == postID)
            .first()
        
        guard let post else {
            throw Abort(.notFound, reason: "Post not found.")
        }

        return post
    }
}

enum VoteDirection {
    case up
    case down
    case none
    
    init?(string: String?) {
        switch string {
        case "up":
            self = .up
        case "down":
            self = .down
        case "null":
            self = .none
        default:
            return nil
        }
    }
    
    var effectValue: Int {
        switch self {
        case .up: 1
        case .down: -1
        case .none: 0
        }
    }
    
    var jsonValue: String {
        switch self {
        case .up: "up"
        case .down: "down"
        case .none: "null"
        }
    }
}
