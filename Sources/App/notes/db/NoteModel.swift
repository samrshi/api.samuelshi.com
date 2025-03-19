//
//  NoteModel.swift
//  api
//
//  Created by Samuel Shi on 3/3/25.
//

import Fluent
import Vapor

final class NoteModel: Model, @unchecked Sendable {
    static let schema = "notes"
    
    @ID(key: .id) var id: UUID?
    @Field(key: "pid") var pid: String
    @Field(key: "contents") var contents: String
    @Timestamp(key: "timestamp", on: .create) var timestamp: Date?

    var content: NoteContent {
        get throws {
            guard let timestamp, let id else {
                throw Abort(.internalServerError, reason: "NoteModel → NoteContent conversion failed.")
            }
            
            let dateFormat = Date.FormatStyle(
                date: .numeric,
                time: .shortened,
                locale: .init(identifier: "en_US"),
                timeZone: .init(identifier: "America/New_York") ?? .gmt
            )
            
            return NoteContent(
                id: id,
                contents: contents,
                timestamp: timestamp.formatted(dateFormat)
            )
        }
    }
}

extension NoteModel {
    convenience init(newNote: NewNoteContent, pid: String) {
        self.init()
        self.pid = pid
        self.contents = newNote.contents
    }
}
