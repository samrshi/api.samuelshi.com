//
//  PostRoutes.swift
//  api
//
//  Created by Samuel Shi on 3/20/25.
//

import Fluent
import Vapor

struct PostRoutes: RouteCollection {
    func boot(routes posts: any RoutesBuilder) throws {
        posts.get { try await getPosts(request: $0) }
//        posts.post { try await createPosts(request: $0) }
    }
    
    private func getPosts(request: Request) async throws -> [PostContent] {
        return []
    }
    
//    private func createPosts(request: Request) async throws -> PostContent {
//        
//    }
}
