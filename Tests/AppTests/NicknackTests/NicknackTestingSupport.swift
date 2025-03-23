//
//  File.swift
//  api
//
//  Created by Samuel Shi on 3/20/25.
//

import Foundation
@testable import App

extension CommunityContent: Equatable {
    public static func == (lhs: CommunityContent, rhs: CommunityContent) -> Bool {
        lhs.id == rhs.id && lhs.name == rhs.name
    }
}

extension CommunityContent: CustomStringConvertible {
    public var description: String {
        "Community: \(name)"
    }
}

extension PostContent: Equatable {
    public static func == (lhs: PostContent, rhs: PostContent) -> Bool {
        lhs.id == rhs.id && lhs.contents == rhs.contents
    }
}

extension PostContent: CustomStringConvertible {
    public var description: String {
        "Post: \(contents)"
    }
}

extension VoteModel: Equatable {
    public static func == (lhs: VoteModel, rhs: VoteModel) -> Bool {
        lhs.creatorPID == rhs.creatorPID && lhs.value == rhs.value
    }
}
