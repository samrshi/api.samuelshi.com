//
//  PostModel.swift
//  api
//
//  Created by Samuel Shi on 3/20/25.
//

import Fluent
import Foundation
import Vapor

final class PostModel: Model, @unchecked Sendable {
    static let schema: String = "nicknack_posts"
    
    @ID var id: UUID?
    @Parent(key: "community_id") var community: CommunityModel

    @Field(key: "contents") var contents: String
    @Field(key: "creator_pid") var creatorPID: String
    @Timestamp(key: "timestamp", on: .create) var timestamp: Date?
    
    @Children(for: \.$post) var votes: [VoteModel]
}

extension PostModel {
    convenience init(creatorPID: String, new: NewPostContent) {
        self.init(
            contents: new.contents,
            creatorPID: creatorPID
        )
    }
    
    convenience init(
        id: UUID? = nil,
        contents: String,
        creatorPID: String
    ) {
        self.init()
        self.id = id
        self.contents = contents
        self.creatorPID = creatorPID
    }
}

extension PostModel {
    func content() throws -> PostContent {
        guard let timestamp else { throw Abort(.internalServerError) }
        
        return PostContent(
            id: try requireID(),
            communityID: $community.id,
            contents: contents,
            creatorPID: creatorPID,
            timestamp: timestamp
        )
    }
}
