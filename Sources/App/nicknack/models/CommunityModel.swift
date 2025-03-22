//
//  CommunityModel.swift
//  api
//
//  Created by Samuel Shi on 3/20/25.
//

import Fluent
import Foundation

final class CommunityModel: Model, @unchecked Sendable {
    static let schema: String = "nicknack_communities"
    
    @ID var id: UUID?
    @Field(key: "creator_pid") var creatorPID: String
    @Field(key: "community_code") var communityCode: String
    
    @Field(key: "name") var name: String
    @Field(key: "hex_color") var hexColor: String
    @Field(key: "sf_symbol_name") var sfSymbolName: String
    
    @Children(for: \.$community) var posts: [PostModel]
    @Children(for: \.$community) var members: [CommunityMemberModel]
}

extension CommunityModel {
    convenience init(creatorPID: String, new: NewCommunityContent) {
        let makeRandomLetters = { (count: Int) in
            "abcdefghijklmnopqrstuvwxyz"
                .randomSample(count: count)
                .map { String($0) }
                .joined()
        }
        
        self.init(
            creatorPID: creatorPID,
            communityCode: "\(makeRandomLetters(5))-\(makeRandomLetters(5))",
            name: new.name,
            hexColor: new.hexColor,
            sfSymbolName: new.sfSymbolName
        )
    }
    
    convenience init(
        id: UUID? = nil,
        creatorPID: String,
        communityCode: String,
        name: String,
        hexColor: String,
        sfSymbolName: String
    ) {
        self.init()
        self.id = id
        self.creatorPID = creatorPID
        self.communityCode = communityCode
        self.name = name
        self.hexColor = hexColor
        self.sfSymbolName = sfSymbolName
    }
}

extension CommunityModel {
    func content() throws -> CommunityContent {
        CommunityContent(
            id: try requireID(),
            name: name,
            hexColor: hexColor,
            sfSymbolName: sfSymbolName,
            communityCode: communityCode
        )
    }
}
