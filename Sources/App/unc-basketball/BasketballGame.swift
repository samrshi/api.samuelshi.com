//
//  BasketballTeam.swift
//  api
//
//  Created by Samuel Shi on 2/26/25.
//

import Vapor

struct Score: Content {
    let unc: Int
    let opponent: Int
}

struct BasketballGame: Content {
    let id: Int
    let team: String // Men's or Women's
    let date: String
    let opponent: String
    let isHomeGame: Bool
    let score: Score
}
