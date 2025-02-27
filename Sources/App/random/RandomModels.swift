//
//  RandomModels.swift
//  api
//
//  Created by Samuel Shi on 2/26/25.
//

import Vapor

struct Definition: Content {
    let word: String
    let definition: String
}

struct Ingredient: Content {
    let name: String
    let amount: String
}

struct Recipe: Content {
    let title: String
    let difficulty: String
    let isVegetarian: Bool
    let ingredients: [Ingredient]
}
