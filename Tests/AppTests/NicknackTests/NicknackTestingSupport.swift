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
        lhs.id == rhs.id
    }
}

extension CommunityContent: CustomStringConvertible {
    public var description: String {
        "Community: \(name)"
    }
}
