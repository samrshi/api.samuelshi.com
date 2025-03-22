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
    let creatorPID: String
    let timestamp: Date
}
