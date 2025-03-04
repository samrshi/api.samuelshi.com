//
//  NoteContent.swift
//  api
//
//  Created by Samuel Shi on 3/3/25.
//

import Vapor

struct NoteContent: Content {
    let id: UUID
    let contents: String
    let timestamp: String
}

struct NewNoteContent: Content {
    let contents: String
}
