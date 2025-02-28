//
//  File.swift
//  api
//
//  Created by Samuel Shi on 2/26/25.
//

import Foundation

enum BasketballData {
    static let basketballGames: [BasketballGame] = [
        // Men November games
        BasketballGame(
            id: 1,
            team: "Men",
            date: "11/04/24",
            opponent: "Elon",
            isHomeGame: true,
            score: Score(unc: 90, opponent: 76)
        ),
        // Women November games
        BasketballGame(
            id: 2,
            team: "Women",
            date: "11/04/24",
            opponent: "Charleston So.",
            isHomeGame: true,
            score: Score(unc: 83, opponent: 53)
        ),
        BasketballGame(
            id: 3,
            team: "Women",
            date: "11/07/24",
            opponent: "UNCW",
            isHomeGame: true,
            score: Score(unc: 77, opponent: 50)
        ),
        BasketballGame(
            id: 4,
            team: "Men",
            date: "11/08/24",
            opponent: "Kansas",
            isHomeGame: false,
            score: Score(unc: 89, opponent: 92)
        ),
        BasketballGame(
            id: 5,
            team: "Women",
            date: "11/12/24",
            opponent: "N.C. A&T",
            isHomeGame: false,
            score: Score(unc: 66, opponent: 47)
        ),
        BasketballGame(
            id: 6,
            team: "Men",
            date: "11/15/24",
            opponent: "American",
            isHomeGame: true,
            score: Score(unc: 107, opponent: 55)
        ),
        BasketballGame(
            id: 7,
            team: "Women",
            date: "11/15/24",
            opponent: "UConn",
            isHomeGame: false,
            score: Score(unc: 58, opponent: 69)
        ),
        BasketballGame(
            id: 8,
            team: "Men",
            date: "11/22/24",
            opponent: "Hawaii",
            isHomeGame: false,
            score: Score(unc: 87, opponent: 69)
        ),
        BasketballGame(
            id: 9,
            team: "Women",
            date: "11/23/24",
            opponent: "Ball St.",
            isHomeGame: false,
            score: Score(unc: 63, opponent: 52)
        ),
        BasketballGame(
            id: 10,
            team: "Women",
            date: "11/24/24",
            opponent: "Villanova",
            isHomeGame: false,
            score: Score(unc: 53, opponent: 36)
        ),
        BasketballGame(
            id: 11,
            team: "Men",
            date: "11/25/24",
            opponent: "Dayton",
            isHomeGame: false,
            score: Score(unc: 92, opponent: 90)
        ),
        BasketballGame(
            id: 12,
            team: "Women",
            date: "11/25/24",
            opponent: "Indiana",
            isHomeGame: false,
            score: Score(unc: 69, opponent: 39)
        ),
        BasketballGame(
            id: 13,
            team: "Men",
            date: "11/26/24",
            opponent: "Auburn",
            isHomeGame: false,
            score: Score(unc: 72, opponent: 85)
        ),
        BasketballGame(
            id: 14,
            team: "Men",
            date: "11/27/24",
            opponent: "Michigan St.",
            isHomeGame: false,
            score: Score(unc: 91, opponent: 94)
        ),
        BasketballGame(
            id: 15,
            team: "Women",
            date: "11/29/24",
            opponent: "N.C. Central",
            isHomeGame: true,
            score: Score(unc: 119, opponent: 43)
        ),
        
        // December games
        BasketballGame(
            id: 16,
            team: "Men",
            date: "12/04/24",
            opponent: "Alabama",
            isHomeGame: true,
            score: Score(unc: 79, opponent: 94)
        ),
        BasketballGame(
            id: 17,
            team: "Women",
            date: "12/05/24",
            opponent: "Kentucky",
            isHomeGame: true,
            score: Score(unc: 72, opponent: 53)
        ),
        BasketballGame(
            id: 18,
            team: "Men",
            date: "12/07/24",
            opponent: "Georgia Tech",
            isHomeGame: true,
            score: Score(unc: 68, opponent: 65)
        ),
        BasketballGame(
            id: 19,
            team: "Women",
            date: "12/08/24",
            opponent: "Coppin St.",
            isHomeGame: true,
            score: Score(unc: 72, opponent: 46)
        ),
        BasketballGame(
            id: 20,
            team: "Women",
            date: "12/11/24",
            opponent: "UNC Greensboro",
            isHomeGame: true,
            score: Score(unc: 80, opponent: 56)
        ),
        BasketballGame(
            id: 21,
            team: "Men",
            date: "12/14/24",
            opponent: "La Salle",
            isHomeGame: true,
            score: Score(unc: 93, opponent: 67)
        ),
        BasketballGame(
            id: 22,
            team: "Women",
            date: "12/15/24",
            opponent: "Georgia Tech",
            isHomeGame: true,
            score: Score(unc: 76, opponent: 82)
        ),
        BasketballGame(
            id: 23,
            team: "Men",
            date: "12/17/24",
            opponent: "Florida",
            isHomeGame: false,
            score: Score(unc: 84, opponent: 90)
        ),
        BasketballGame(
            id: 24,
            team: "Women",
            date: "12/18/24",
            opponent: "Florida",
            isHomeGame: false,
            score: Score(unc: 77, opponent: 57)
        ),
        BasketballGame(
            id: 25,
            team: "Men",
            date: "12/21/24",
            opponent: "UCLA",
            isHomeGame: false,
            score: Score(unc: 76, opponent: 74)
        ),
        BasketballGame(
            id: 26,
            team: "Women",
            date: "12/21/24",
            opponent: "Norfolk St.",
            isHomeGame: true,
            score: Score(unc: 90, opponent: 47)
        ),
        BasketballGame(
            id: 27,
            team: "Men",
            date: "12/29/24",
            opponent: "Campbell",
            isHomeGame: true,
            score: Score(unc: 97, opponent: 81)
        ),
        BasketballGame(
            id: 28,
            team: "Women",
            date: "12/29/24",
            opponent: "Miami (FL)",
            isHomeGame: false,
            score: Score(unc: 69, opponent: 60)
        ),
        
        // January games
        BasketballGame(
            id: 29,
            team: "Men",
            date: "01/01/25",
            opponent: "Louisville",
            isHomeGame: false,
            score: Score(unc: 70, opponent: 83)
        ),
        BasketballGame(
            id: 30,
            team: "Men",
            date: "01/04/25",
            opponent: "Notre Dame",
            isHomeGame: false,
            score: Score(unc: 74, opponent: 73)
        ),
        BasketballGame(
            id: 31,
            team: "Women",
            date: "01/05/25",
            opponent: "Notre Dame",
            isHomeGame: true,
            score: Score(unc: 66, opponent: 76)
        ),
        BasketballGame(
            id: 32,
            team: "Men",
            date: "01/07/25",
            opponent: "SMU",
            isHomeGame: true,
            score: Score(unc: 82, opponent: 67)
        ),
        BasketballGame(
            id: 33,
            team: "Women",
            date: "01/09/25",
            opponent: "Duke",
            isHomeGame: true,
            score: Score(unc: 53, opponent: 46)
        ),
        BasketballGame(
            id: 34,
            team: "Men",
            date: "01/11/25",
            opponent: "NC State",
            isHomeGame: false,
            score: Score(unc: 63, opponent: 61)
        ),
        BasketballGame(
            id: 35,
            team: "Women",
            date: "01/12/25",
            opponent: "Boston College",
            isHomeGame: true,
            score: Score(unc: 80, opponent: 67)
        ),
        BasketballGame(
            id: 36,
            team: "Men",
            date: "01/15/25",
            opponent: "California",
            isHomeGame: true,
            score: Score(unc: 79, opponent: 53)
        ),
        BasketballGame(
            id: 37,
            team: "Women",
            date: "01/16/25",
            opponent: "SMU",
            isHomeGame: false,
            score: Score(unc: 64, opponent: 33)
        ),
        BasketballGame(
            id: 38,
            team: "Men",
            date: "01/18/25",
            opponent: "Stanford",
            isHomeGame: true,
            score: Score(unc: 71, opponent: 72)
        ),
        BasketballGame(
            id: 39,
            team: "Women",
            date: "01/19/25",
            opponent: "Pittsburgh",
            isHomeGame: false,
            score: Score(unc: 75, opponent: 58)
        ),
        BasketballGame(
            id: 40,
            team: "Men",
            date: "01/21/25",
            opponent: "Wake Forest",
            isHomeGame: false,
            score: Score(unc: 66, opponent: 67)
        ),
        BasketballGame(
            id: 41,
            team: "Women",
            date: "01/23/25",
            opponent: "Wake Forest",
            isHomeGame: true,
            score: Score(unc: 76, opponent: 51)
        ),
        BasketballGame(
            id: 42,
            team: "Men",
            date: "01/25/25",
            opponent: "Boston College",
            isHomeGame: true,
            score: Score(unc: 102, opponent: 96)
        ),
        BasketballGame(
            id: 43,
            team: "Women",
            date: "01/26/25",
            opponent: "Florida St.",
            isHomeGame: true,
            score: Score(unc: 84, opponent: 86)
        ),
        BasketballGame(
            id: 44,
            team: "Men",
            date: "01/28/25",
            opponent: "Pittsburgh",
            isHomeGame: false,
            score: Score(unc: 65, opponent: 73)
        ),
        BasketballGame(
            id: 45,
            team: "Women",
            date: "01/30/25",
            opponent: "California",
            isHomeGame: false,
            score: Score(unc: 65, opponent: 52)
        ),
        
        // February games
        BasketballGame(
            id: 46,
            team: "Men",
            date: "02/01/25",
            opponent: "Duke",
            isHomeGame: false,
            score: Score(unc: 70, opponent: 87)
        ),
        BasketballGame(
            id: 47,
            team: "Women",
            date: "02/02/25",
            opponent: "Stanford",
            isHomeGame: false,
            score: Score(unc: 69, opponent: 67)
        ),
        BasketballGame(
            id: 48,
            team: "Men",
            date: "02/08/25",
            opponent: "Pittsburgh",
            isHomeGame: true,
            score: Score(unc: 67, opponent: 66)
        ),
        BasketballGame(
            id: 49,
            team: "Women",
            date: "02/09/25",
            opponent: "Clemson",
            isHomeGame: false,
            score: Score(unc: 53, opponent: 51)
        ),
        BasketballGame(
            id: 50,
            team: "Men",
            date: "02/10/25",
            opponent: "Clemson",
            isHomeGame: false,
            score: Score(unc: 65, opponent: 85)
        ),
        BasketballGame(
            id: 51,
            team: "Women",
            date: "02/13/25",
            opponent: "Virginia Tech",
            isHomeGame: true,
            score: Score(unc: 67, opponent: 62)
        ),
        BasketballGame(
            id: 52,
            team: "Men",
            date: "02/15/25",
            opponent: "Syracuse",
            isHomeGame: false,
            score: Score(unc: 88, opponent: 82)
        ),
        BasketballGame(
            id: 53,
            team: "Women",
            date: "02/16/25",
            opponent: "NC State",
            isHomeGame: true,
            score: Score(unc: 66, opponent: 65)
        ),
        BasketballGame(
            id: 54,
            team: "Men",
            date: "02/19/25",
            opponent: "NC State",
            isHomeGame: true,
            score: Score(unc: 97, opponent: 73)
        ),
        BasketballGame(
            id: 55,
            team: "Women",
            date: "02/20/25",
            opponent: "Syracuse",
            isHomeGame: false,
            score: Score(unc: 68, opponent: 58)
        ),
        BasketballGame(
            id: 56,
            team: "Men",
            date: "02/22/25",
            opponent: "Virginia",
            isHomeGame: true,
            score: Score(unc: 81, opponent: 66)
        ),
        BasketballGame(
            id: 57,
            team: "Women",
            date: "02/23/25",
            opponent: "Louisville",
            isHomeGame: false,
            score: Score(unc: 79, opponent: 75)
        ),
        BasketballGame(
            id: 58,
            team: "Men",
            date: "02/24/25",
            opponent: "Florida St.",
            isHomeGame: false,
            score: Score(unc: 96, opponent: 85)
        )
    ]
}
