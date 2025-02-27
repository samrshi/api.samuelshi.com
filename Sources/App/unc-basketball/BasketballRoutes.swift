//
//  File.swift
//  api
//
//  Created by Samuel Shi on 2/26/25.
//

import Vapor

struct BasketballRoutes: RouteCollection {
    func boot(routes: any RoutesBuilder) throws {
        routes.get("uncbasketball") { teams(request: $0) }
    }
    
    func teams(request: Request) -> [BasketballTeam] {
        [.womens, .mens]
    }
}
