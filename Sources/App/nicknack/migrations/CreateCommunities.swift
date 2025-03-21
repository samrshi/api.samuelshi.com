//
//  CreateCommunitiesMigration.swift
//  api
//
//  Created by Samuel Shi on 3/20/25.
//

import Fluent

struct CreateCommunities: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema(CommunityModel.schema)
            .id()
            .field("creator_pid", .string, .required)
            .field("community_code", .string, .required)
        
            .field("name", .string, .required)
            .field("hex_color", .string, .required)
            .field("sf_symbol_name", .string, .required)
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema(CommunityModel.schema).delete()
    }
}
