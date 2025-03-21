//
//  NicknackRoutes.swift
//  api
//
//  Created by Samuel Shi on 3/20/25.
//

import Fluent
import Vapor

struct NicknackRoutes: RouteCollection {
    func boot(routes: any RoutesBuilder) throws {
        try routes
            .grouped(PIDAuthMiddleware())
            .grouped("nicknack")
            .grouped("communities")
            .register(collection: CommunityRoutes())
    }
}
