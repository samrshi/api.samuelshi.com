//
//  CreatePosts.swift
//  api
//
//  Created by Samuel Shi on 3/20/25.
//

import Fluent
import Foundation

struct CreatePosts: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema(PostModel.schema)
            .id()
            .field("community_id", .uuid, .required, .references(CommunityModel.schema, "id", onDelete: .cascade))
            .field("contents", .string, .required)
            .field("creator_pid", .string, .required)
            .field("timestamp", .datetime, .required)
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema(PostModel.schema).delete()
    }
}
