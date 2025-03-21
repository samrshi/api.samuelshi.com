//
//  PostModel.swift
//  api
//
//  Created by Samuel Shi on 3/20/25.
//

import Fluent
import Foundation

final class PostModel: Model, @unchecked Sendable {
    static let schema: String = "nicknack_posts"
    
    @ID var id: UUID?
    @Parent(key: "community_id") var community: CommunityModel

    @Field(key: "contents") var contents: String
    @Field(key: "creator_pid") var creatorPID: String
    @Timestamp(key: "timestamp", on: .create) var timestamp: Date?
    
    @Children(for: \.$post) var votes: [VoteModel]
}
