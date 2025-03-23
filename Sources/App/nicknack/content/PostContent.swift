//
//  PostContent.swift
//  api
//
//  Created by Samuel Shi on 3/21/25.
//

import Vapor

struct PostContent: Content {
    let id: UUID
    let communityID: UUID

    let contents: String
    let timestamp: Date
    
    let netVotes: Int
    let userHasUpvoted: Bool
    let userHasDownvoted: Bool
    
    let userIsCreator: Bool
}
