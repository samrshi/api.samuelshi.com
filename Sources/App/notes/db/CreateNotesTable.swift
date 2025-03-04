//
//  CreateNotesTable.swift
//  api
//
//  Created by Samuel Shi on 3/3/25.
//

import Fluent

struct CreateNotesTable: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema(NoteModel.schema)
            .id()
            .field("pid", .string, .required)
            .field("contents", .string, .required)
            .field("timestamp", .datetime, .required)
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema(NoteModel.schema).delete()
    }
}
