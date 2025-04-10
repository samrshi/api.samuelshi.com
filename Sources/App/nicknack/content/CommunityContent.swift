//
//  CommunityContent.swift
//  api
//
//  Created by Samuel Shi on 3/20/25.
//

import Vapor

struct CommunityContent: Content {
    let id: UUID
    let name: String
    let communityCode: String
    let userIsCreator: Bool
    
    let hexColor: String
    let sfSymbolName: String
}
