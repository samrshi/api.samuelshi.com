//
//  NotesRoutes.swift
//  api
//
//  Created by Samuel Shi on 3/3/25.
//

import Fluent
import Vapor

struct NotesRoutes: RouteCollection {
    func boot(routes: any RoutesBuilder) throws {
        // Protect routes w/ "authentication"
        let protected = routes.grouped(PIDAuthMiddleware())
        
        // Actual /notes routes
        let routes = protected.grouped("notes")
        routes.get { try await get(request: $0) }
        routes.post { try await create(request: $0) }
        routes.delete(":id") { try await delete(request: $0) }
    }
    
    func get(request: Request) async throws -> [NoteContent] {
        let user = try request.auth.require(PIDUser.self)
        
        return try await NoteModel.query(on: request.db)
            .filter(\.$pid == user.pid)
            .sort(\.$timestamp, .descending)
            .all()
            .map { try $0.content }
    }
    
    func create(request: Request) async throws -> NoteContent {
        let user = try request.auth.require(PIDUser.self)
        
        let newNote = try request.content.decode(NewNoteContent.self)
        let noteModel = NoteModel(newNote: newNote, pid: user.pid)
        
        try await noteModel.save(on: request.db)
        return try noteModel.content
    }
    
    func delete(request: Request) async throws -> HTTPStatus {
        let user = try request.auth.require(PIDUser.self)
        
        let noteID: UUID? = request.parameters.get("id")
        let note: NoteModel? = try await NoteModel.find(noteID, on: request.db)
        
        guard let note, note.pid == user.pid else {
            throw Abort(.notFound)
        }
        
        try await note.delete(on: request.db)
        return .noContent
    }
}
