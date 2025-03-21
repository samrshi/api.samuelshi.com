//
//  PIDUser.swift
//  api
//
//  Created by Samuel Shi on 3/4/25.
//

import Vapor

struct PIDUser: Authenticatable {
    let pid: String
}
