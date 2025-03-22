//
//  PostModel.swift
//  api
//
//  Created by Samuel Shi on 3/20/25.
//

import Fluent
import Foundation

final class VoteModel: Model, @unchecked Sendable {
    static let schema: String = "nicknack_votes"
    
    @ID var id: UUID?
    @Parent(key: "post_id") var post: PostModel
    @Field(key: "creator_pid") var creatorPID: String
    @Field(key: "direction") var direction: Int // 1 (upvote), 0 (none), -1 (downvote)
}

extension VoteModel {
    convenience init(
        creatorPID: String,
        direction: Int
    ) {
        self.init()
        self.creatorPID = creatorPID
        self.direction = direction
    }
}
