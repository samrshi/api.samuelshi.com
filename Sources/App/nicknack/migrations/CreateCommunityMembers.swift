//
//  CreateCommunityMembers.swift
//  api
//
//  Created by Samuel Shi on 3/20/25.
//

import Fluent
import Foundation

struct CreateCommunityMembers: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema(CommunityMemberModel.schema)
            .id()
            .field("user_pid", .string, .required)
            .field("community_id", .uuid, .required, .references(CommunityModel.schema, "id", onDelete: .cascade))
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema(CommunityMemberModel.schema).delete()
    }
}
