//
//  CreateVotes.swift
//  api
//
//  Created by Samuel Shi on 3/20/25.
//

import Foundation
import Fluent

struct CreateVotes: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema(VoteModel.schema)
            .id()
            .field("post_id", .uuid, .required, .references(PostModel.schema, "id"))
            .field("creator_pid", .string, .required)
            .field("direction", .int8, .required)
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema(VoteModel.schema).delete()
    }
}
