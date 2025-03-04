//
//  NotesAuthMiddleware.swift
//  api
//
//  Created by Samuel Shi on 3/4/25.
//

import Vapor

/// Bad, terrible, insecure auth middleware for demo purposes only.
struct NotesAuthMiddleware: AsyncMiddleware {
    func respond(
        to request: Request,
        chainingTo next: any AsyncResponder
    ) async throws -> Response {
        guard let pid = request.headers.bearerAuthorization?.token else {
            throw Abort(.badRequest, reason: "Must provide API key.")
        }
        
        // Validate PID
        let isNumeric = pid.allSatisfy { $0.isNumber }
        let isNineCharacters = pid.count == 9
        guard isNumeric && isNineCharacters else {
            throw Abort(.unauthorized, reason: "Invalid API key.")
        }
        
        request.auth.login(NotesUser(pid: pid))
        return try await next.respond(to: request)
    }
}
