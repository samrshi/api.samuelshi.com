//
//  File.swift
//  api
//
//  Created by Samuel Shi on 3/20/25.
//

import Foundation
import Fluent

final class CommunityMemberModel: Model, @unchecked Sendable {
    static let schema: String = "nicknack_community_members"
    
    @ID var id: UUID?
    @Field(key: "user_pid") var userPID: String
    @Parent(key: "community_id") var community: CommunityModel
}

extension CommunityMemberModel {
    convenience init(userPID: String) {
        self.init()
        self.userPID = userPID
    }
}
