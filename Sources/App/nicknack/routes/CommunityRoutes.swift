//
//  CommunityRoutes.swift
//  api
//
//  Created by Samuel Shi on 3/20/25.
//

import Fluent
import Vapor

struct CommunityRoutes: RouteCollection {
    func boot(routes communities: any RoutesBuilder) throws {
        communities.get { try await getCommunities(request: $0) }
        communities.post { try await createCommunity(request: $0) }
        communities.put("membership") { try await changeMembership(request: $0) }

        try communities.group(":community-id") { community in
            community.delete { try await deleteCommunity(request: $0) }
            
            try community
                .grouped("posts")
                .register(collection: PostRoutes())
        }
    }
    
    private func getCommunities(request: Request) async throws -> [CommunityContent] {
        let user = try request.auth.require(PIDUser.self)
        
        // TODO: Filter through memberships
        let createdByUser = try await CommunityModel.query(on: request.db)
            .filter(\.$creatorPID == user.pid)
            .all()
            .map { try $0.content(forPID: user.pid) }
        
        let joinedByUser = try await CommunityModel.query(on: request.db)
            .join(children: \.$members)
            .filter(CommunityMemberModel.self, \.$userPID == user.pid)
            .all()
            .map { try $0.content(forPID: user.pid) }

        return createdByUser + joinedByUser
    }
    
    private func createCommunity(request: Request) async throws -> CommunityContent {
        let user = try request.auth.require(PIDUser.self)
        let new = try request.content.decode(NewCommunityContent.self)
        
        let model = CommunityModel(creatorPID: user.pid, new: new)
        try await model.save(on: request.db)
        return try model.content(forPID: user.pid)
    }
    
    private func deleteCommunity(request: Request) async throws -> HTTPStatus {
        let user = try request.auth.require(PIDUser.self)

        let communityID: UUID? = request.parameters.get("community-id")
        let community = try await CommunityModel.find(communityID, on: request.db)
        
        guard let community else {
            throw Abort(.notFound, reason: "Community not found.")
        }
        
        guard community.creatorPID == user.pid else {
            throw Abort(.unauthorized, reason: "Communities can only be deleted by their creators.")
        }
        
        try await community.delete(on: request.db)
        return .noContent
    }
    
    private func changeMembership(request: Request) async throws -> CommunityContent {
        // TODO: Community code should be case insensitive
        let user = try request.auth.require(PIDUser.self)

        guard let communityCode: String = request.content["communityCode"] else {
            throw Abort(.badRequest, reason: "Must provide community code.")
        }
        
        let community = try await CommunityModel.query(on: request.db)
            .filter(\.$communityCode == communityCode)
            .first()
        
        guard let community else {
            throw Abort(.notFound, reason: "No community found for given community code.")
        }
        
        guard let direction: String = request.content["direction"] else {
            throw Abort(.badRequest, reason: "Must provide direction (join or leave).")
        }

        if direction == "join" {
            return try await join(community: community, pid: user.pid, request: request)
        } else if direction == "leave" {
            return try await leave(community: community, pid: user.pid, request: request)
        } else {
            throw Abort(.badRequest, reason: "Direction must be either join or leave.")
        }
    }
    
    private func join(community: CommunityModel, pid: String, request: Request) async throws -> CommunityContent {
        let members = try await community.$members.get(on: request.db)
        let alreadyAMember = members.contains { $0.userPID == pid }
        
        guard !alreadyAMember else {
            return try community.content(forPID: pid)
        }
        
        let membership = CommunityMemberModel(userPID: pid)
        try await community.$members.create(membership, on: request.db)
        return try community.content(forPID: pid)
    }
    
    private func leave(community: CommunityModel, pid: String, request: Request) async throws -> CommunityContent {
        let members = try await community.$members.get(on: request.db)
        let userMemberships = members.filter { $0.userPID == pid }
        
        guard !userMemberships.isEmpty else {
            return try community.content(forPID: pid)
        }
        
        for membership in userMemberships {
            try await membership.delete(on: request.db)
        }
        
        return try community.content(forPID: pid)
    }
}
