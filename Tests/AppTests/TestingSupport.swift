//
//  File.swift
//  api
//
//  Created by Samuel Shi on 3/20/25.
//

import Fluent
import FluentSQLiteDriver
import Testing
import VaporTesting
@testable import App


extension TestingHTTPRequest {
    var bearerToken: String {
        get { fatalError() }
        set { headers.bearerAuthorization = .init(token: newValue) }
    }
}

// MARK: Conveniences

func testEndpoint(
    _ method: HTTPMethod,
    _ pathComponents: String...,
    headers: HTTPHeaders = [:],
    body: ByteBuffer? = nil,
    fileID: String = #fileID,
    filePath: String = #filePath,
    line: Int = #line,
    column: Int = #column,
    beforeRequest: (inout TestingHTTPRequest, any Database) async throws -> Void,
    afterResponse: (TestingHTTPResponse, any Database) async throws -> Void
) async throws {
    try await testEndpoint(
        method,
        pathComponents,
        headers: headers,
        body: body,
        fileID: fileID,
        filePath: filePath,
        line: line,
        column: column,
        beforeRequest: beforeRequest,
        afterResponse: afterResponse
    )
}

// MARK: Implementations

private func testEndpoint(
    _ method: HTTPMethod,
    _ pathComponents: [String],
    headers: HTTPHeaders = [:],
    body: ByteBuffer? = nil,
    fileID: String = #fileID,
    filePath: String = #filePath,
    line: Int = #line,
    column: Int = #column,
    beforeRequest: (inout TestingHTTPRequest, any Database) async throws -> Void,
    afterResponse: (TestingHTTPResponse, any Database) async throws -> Void
) async throws {
    try await withSQLiteApp { app in
        try await app.testing().test(
            method,
            pathComponents.joined(separator: "/"),
            headers: headers,
            body: body,
            fileID: fileID,
            filePath: filePath,
            line: line,
            column: column,
            beforeRequest: { try await beforeRequest(&$0, app.db) },
            afterResponse: { try await afterResponse($0, app.db) }
        )
    }
}

private func withSQLiteApp(_ test: (Application) async throws -> Void) async throws {
    let app = try await Application.make(.testing)
    app.databases.use(.sqlite(.memory), as: .sqlite)

    do {
        try await configure(app)
        try await app.autoMigrate()
        try await test(app)
        try await app.autoRevert()
    }
    catch {
        try? await app.autoRevert()
        try await app.asyncShutdown()
        throw error
    }
    try await app.asyncShutdown()
}
