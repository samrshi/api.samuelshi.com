//
//  RandomRoutes.swift
//  api
//
//  Created by Samuel Shi on 2/24/25.
//

import Vapor

struct RandomRoutes: RouteCollection {
    let service = RandomService()

    func boot(routes: any RoutesBuilder) throws {
        let routes = routes.grouped("random")
        routes.get("word") { try word(request: $0) }
        routes.get("words") { try words(request: $0) }
        routes.get("definitions") { try definitions(request: $0) }
        routes.get("recipe") { try recipe(request: $0) }
    }
    
    func word(request: Request) throws -> String {
        try service.randomWord()
    }
    
    func words(request: Request) throws -> [String] {
        try service.randomWords(count: 10)
    }
    
    func definitions(request: Request) throws -> [Definition] {
        try service.randomDefinitions(count: 10)
    }
    
    func recipe(request: Request) throws -> Recipe {
        try service.randomRecipe()
    }
}
