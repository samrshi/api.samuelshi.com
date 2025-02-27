//
//  RandomService.swift
//  api
//
//  Created by Samuel Shi on 2/24/25.
//

import Synchronization
import Vapor

// TODO: Change this to an actor?

final class RandomService: Sendable {
    private let _words: Mutex<[String]?> = Mutex(nil)
    
    func randomWord() throws -> String {
        guard let word = RandomData.words.randomElement() else {
            throw Abort(.internalServerError, reason: "Word list unexpectedly empty.")
        }
        
        return word.capitalized
    }
    
    func randomWords(count: Int) throws -> [String] {
        let count = min(count, RandomData.words.count)
        
        return (1 ... count).compactMap { _ in
            RandomData.words.indices.randomElement().map { RandomData.words[$0].capitalized }
        }
    }
    
    func randomDefinition() throws -> Definition {
        guard let definition = RandomData.definitions.randomElement() else {
            throw Abort(.internalServerError, reason: "Definition list unexpectedly empty.")
        }
        
        return definition
    }
    
    func randomRecipe() throws -> Recipe {
        guard let recipe = RandomData.recipes.randomElement() else {
            throw Abort(.internalServerError, reason: "Recipes list unexpectedly empty.")
        }
        
        return recipe
    }
}

extension RandomService {
    
}
