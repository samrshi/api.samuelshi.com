//
//  NewCommunityContent.swift
//  api
//
//  Created by Samuel Shi on 3/20/25.
//

import Vapor

struct NewCommunityContent: Content {
    let name: String
    let hexColor: String
    let sfSymbolName: String
}
