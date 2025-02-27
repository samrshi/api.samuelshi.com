//
//  File.swift
//  api
//
//  Created by Samuel Shi on 2/26/25.
//

import Foundation

extension BasketballTeam {
    static let mens = BasketballTeam(
        name: "UNC Men's Basketball",
        wins: 18,
        losses: 11,
        gameResults: [
            // If a game line starts with "at" or "vs", we mark isHomeGame as false.
            GameResult(date: "11/04/24", opponent: "Elon", uncScore: "90", opponentScore: "76", isHomeGame: true),
            GameResult(date: "11/08/24", opponent: "Kansas", uncScore: "89", opponentScore: "92", isHomeGame: false),
            GameResult(date: "11/15/24", opponent: "American", uncScore: "107", opponentScore: "55", isHomeGame: true),
            GameResult(date: "11/22/24", opponent: "Hawaii", uncScore: "87", opponentScore: "69", isHomeGame: false),
            GameResult(date: "11/25/24", opponent: "Dayton", uncScore: "92", opponentScore: "90", isHomeGame: false),
            GameResult(date: "11/26/24", opponent: "Auburn", uncScore: "72", opponentScore: "85", isHomeGame: false),
            GameResult(date: "11/27/24", opponent: "Michigan St.", uncScore: "91", opponentScore: "94", isHomeGame: false),
            GameResult(date: "12/04/24", opponent: "Alabama", uncScore: "79", opponentScore: "94", isHomeGame: true),
            GameResult(date: "12/07/24", opponent: "Georgia Tech", uncScore: "68", opponentScore: "65", isHomeGame: true),
            GameResult(date: "12/14/24", opponent: "La Salle", uncScore: "93", opponentScore: "67", isHomeGame: true),
            GameResult(date: "12/17/24", opponent: "Florida", uncScore: "84", opponentScore: "90", isHomeGame: false),
            GameResult(date: "12/21/24", opponent: "UCLA", uncScore: "76", opponentScore: "74", isHomeGame: false),
            GameResult(date: "12/29/24", opponent: "Campbell", uncScore: "97", opponentScore: "81", isHomeGame: true),
            GameResult(date: "01/01/25", opponent: "Louisville", uncScore: "70", opponentScore: "83", isHomeGame: false),
            GameResult(date: "01/04/25", opponent: "Notre Dame", uncScore: "74", opponentScore: "73", isHomeGame: false),
            GameResult(date: "01/07/25", opponent: "SMU", uncScore: "82", opponentScore: "67", isHomeGame: true),
            GameResult(date: "01/11/25", opponent: "NC State", uncScore: "63", opponentScore: "61", isHomeGame: false),
            GameResult(date: "01/15/25", opponent: "California", uncScore: "79", opponentScore: "53", isHomeGame: true),
            GameResult(date: "01/18/25", opponent: "Stanford", uncScore: "71", opponentScore: "72", isHomeGame: true),
            GameResult(date: "01/21/25", opponent: "Wake Forest", uncScore: "66", opponentScore: "67", isHomeGame: false),
            GameResult(date: "01/25/25", opponent: "Boston College", uncScore: "102", opponentScore: "96", isHomeGame: true),
            GameResult(date: "01/28/25", opponent: "Pittsburgh", uncScore: "65", opponentScore: "73", isHomeGame: false),
            GameResult(date: "02/01/25", opponent: "Duke", uncScore: "70", opponentScore: "87", isHomeGame: false),
            GameResult(date: "02/08/25", opponent: "Pittsburgh", uncScore: "67", opponentScore: "66", isHomeGame: true),
            GameResult(date: "02/10/25", opponent: "Clemson", uncScore: "65", opponentScore: "85", isHomeGame: false),
            GameResult(date: "02/15/25", opponent: "Syracuse", uncScore: "88", opponentScore: "82", isHomeGame: false),
            GameResult(date: "02/19/25", opponent: "NC State", uncScore: "97", opponentScore: "73", isHomeGame: true),
            GameResult(date: "02/22/25", opponent: "Virginia", uncScore: "81", opponentScore: "66", isHomeGame: true),
            GameResult(date: "02/24/25", opponent: "Florida St.", uncScore: "96", opponentScore: "85", isHomeGame: false)
        ]
    )
    
    static let womens = BasketballTeam(
        name: "UNC Women's Basketball",
        wins: 25,
        losses: 4,
        gameResults: [
            GameResult(date: "11/04/24", opponent: "Charleston So.", uncScore: "83", opponentScore: "53", isHomeGame: true),
            GameResult(date: "11/07/24", opponent: "UNCW", uncScore: "77", opponentScore: "50", isHomeGame: true),
            GameResult(date: "11/12/24", opponent: "N.C. A&T", uncScore: "66", opponentScore: "47", isHomeGame: false),
            GameResult(date: "11/15/24", opponent: "UConn", uncScore: "58", opponentScore: "69", isHomeGame: false),
            GameResult(date: "11/23/24", opponent: "Ball St.", uncScore: "63", opponentScore: "52", isHomeGame: false),
            GameResult(date: "11/24/24", opponent: "Villanova", uncScore: "53", opponentScore: "36", isHomeGame: false),
            GameResult(date: "11/25/24", opponent: "Indiana", uncScore: "69", opponentScore: "39", isHomeGame: false),
            GameResult(date: "11/29/24", opponent: "N.C. Central", uncScore: "119", opponentScore: "43", isHomeGame: true),
            GameResult(date: "12/05/24", opponent: "Kentucky", uncScore: "72", opponentScore: "53", isHomeGame: true),
            GameResult(date: "12/08/24", opponent: "Coppin St.", uncScore: "72", opponentScore: "46", isHomeGame: true),
            GameResult(date: "12/11/24", opponent: "UNC Greensboro", uncScore: "80", opponentScore: "56", isHomeGame: true),
            GameResult(date: "12/15/24", opponent: "Georgia Tech", uncScore: "76", opponentScore: "82", isHomeGame: true),
            GameResult(date: "12/18/24", opponent: "Florida", uncScore: "77", opponentScore: "57", isHomeGame: false),
            GameResult(date: "12/21/24", opponent: "Norfolk St.", uncScore: "90", opponentScore: "47", isHomeGame: true),
            GameResult(date: "12/29/24", opponent: "Miami (FL)", uncScore: "69", opponentScore: "60", isHomeGame: false),
            GameResult(date: "01/05/25", opponent: "Notre Dame", uncScore: "66", opponentScore: "76", isHomeGame: true),
            GameResult(date: "01/09/25", opponent: "Duke", uncScore: "53", opponentScore: "46", isHomeGame: true),
            GameResult(date: "01/12/25", opponent: "Boston College", uncScore: "80", opponentScore: "67", isHomeGame: true),
            GameResult(date: "01/16/25", opponent: "SMU", uncScore: "64", opponentScore: "33", isHomeGame: false),
            GameResult(date: "01/19/25", opponent: "Pittsburgh", uncScore: "75", opponentScore: "58", isHomeGame: false),
            GameResult(date: "01/23/25", opponent: "Wake Forest", uncScore: "76", opponentScore: "51", isHomeGame: true),
            GameResult(date: "01/26/25", opponent: "Florida St.", uncScore: "84", opponentScore: "86", isHomeGame: true),
            GameResult(date: "01/30/25", opponent: "California", uncScore: "65", opponentScore: "52", isHomeGame: false),
            GameResult(date: "02/02/25", opponent: "Stanford", uncScore: "69", opponentScore: "67", isHomeGame: false),
            GameResult(date: "02/09/25", opponent: "Clemson", uncScore: "53", opponentScore: "51", isHomeGame: false),
            GameResult(date: "02/13/25", opponent: "Virginia Tech", uncScore: "67", opponentScore: "62", isHomeGame: true),
            GameResult(date: "02/16/25", opponent: "NC State", uncScore: "66", opponentScore: "65", isHomeGame: true),
            GameResult(date: "02/20/25", opponent: "Syracuse", uncScore: "68", opponentScore: "58", isHomeGame: false),
            GameResult(date: "02/23/25", opponent: "Louisville", uncScore: "79", opponentScore: "75", isHomeGame: false)
        ]
    )
}
