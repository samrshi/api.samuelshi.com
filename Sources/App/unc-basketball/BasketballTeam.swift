//
//  BasketballTeam.swift
//  api
//
//  Created by Samuel Shi on 2/26/25.
//

import Vapor

struct GameResult: Content {
    let date: String
    let opponent: String
    let uncScore: String
    let opponentScore: String
    let isHomeGame: Bool
}

struct BasketballTeam: Content {
    let name: String // UNC Men's Basketball or UNC Women's Basketball
    let wins: Int
    let losses: Int
    let gameResults: [GameResult]
}
