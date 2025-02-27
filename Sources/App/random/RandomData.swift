//
//  RandomData.swift
//  api
//
//  Created by Samuel Shi on 2/26/25.
//

import Foundation

enum RandomData {
    static let words = [
        "apple", "water", "smile", "house", "book", "friend", "time", "music", "tree", "love",
        "sun", "car", "dog", "city", "sleep", "bread", "computer", "family", "coffee", "money",
        "fire", "ocean", "paper", "dream", "child", "light", "school", "heart", "phone", "road",
        "sky", "chair", "flower", "window", "summer", "peace", "doctor", "beach", "story", "moon",
        "snow", "river", "bridge", "movie", "kitchen", "dance", "garden", "morning", "shirt", "baby",
        "picture", "mountain", "journey", "teacher", "clock", "butter", "memory", "forest", "voice", "game",
        "office", "door", "guitar", "birthday", "winter", "laughter", "rain", "dinner", "mirror", "freedom",
        "camera", "chocolate", "library", "farmer", "sunlight", "pillow", "market", "pencil", "island", "future",
        "candle", "holiday", "diamond", "cookie", "rocket", "circus", "thunder", "subway", "planet", "whisper",
        "theater", "honey", "village", "victory", "castle", "elephant", "silver", "stadium", "compass", "autumn",
        "blanket", "crystal", "envelope", "teacup", "dessert", "treasure", "puzzle", "rainbow", "feather", "umbrella"
    ]
    
    static let definitions = [
        Definition(
            word: "apple",
            definition: "A round fruit with red, yellow, or green skin and a white interior"
        ),
        Definition(
            word: "water",
            definition: "A transparent, odorless, tasteless liquid that forms the seas, lakes, rivers, and rain"
        ),
        Definition(
            word: "smile",
            definition: "A pleased, kind, or amused facial expression, typically with the corners of the mouth turned up"
        ),
        Definition(
            word: "book",
            definition: "A written or printed work consisting of pages glued or sewn together along one side"
        ),
        Definition(
            word: "friend",
            definition: "A person whom one knows and with whom one has a bond of mutual affection"
        ),
        Definition(
            word: "time",
            definition: "The indefinite continued progress of existence and events in the past, present, and future"
        ),
        Definition(
            word: "music",
            definition: "Vocal or instrumental sounds combined in such a way as to produce beauty of form, harmony, and expression of emotion"
        ),
        Definition(
            word: "tree",
            definition: "A woody perennial plant with a single main stem or trunk, supporting branches and leaves"
        ),
        Definition(
            word: "love",
            definition: "An intense feeling of deep affection or fondness for someone or something"
        ),
        Definition(
            word: "sun",
            definition: "The star around which the earth orbits, providing light and heat for the earth"
        ),
        Definition(
            word: "car",
            definition: "A four-wheeled road vehicle that is powered by an engine and designed to carry passengers"
        ),
        Definition(
            word: "dog",
            definition: "A domesticated carnivorous mammal that typically has a long snout, an acute sense of smell, and a barking voice"
        ),
        Definition(
            word: "city",
            definition: "A large town, typically with a cathedral, considerable population, and local government"
        ),
        Definition(
            word: "sleep",
            definition: "A condition of body and mind in which consciousness is temporarily lost and the nervous system is inactive"
        ),
        Definition(
            word: "computer",
            definition: "An electronic device capable of storing, retrieving, and processing data according to a series of instructions"
        ),
        Definition(
            word: "family",
            definition: "A group consisting of parents and children living together in a household"
        ),
        Definition(
            word: "coffee",
            definition: "A hot drink made from the roasted and ground seeds of a tropical shrub"
        ),
        Definition(
            word: "money",
            definition: "A current medium of exchange in the form of coins and banknotes"
        ),
        Definition(
            word: "fire",
            definition: "The visible effect of combustion, characterized by flames and heat"
        ),
        Definition(
            word: "ocean",
            definition: "A very large expanse of sea, particularly each of the main areas into which the sea is divided"
        ),
        Definition(
            word: "dream",
            definition: "A series of thoughts, images, and sensations occurring in a person's mind during sleep"
        ),
        Definition(
            word: "light",
            definition: "The natural agent that stimulates sight and makes things visible"
        ),
        Definition(
            word: "heart",
            definition: "A hollow muscular organ that pumps blood through the circulatory system"
        ),
        Definition(
            word: "phone",
            definition: "A device used to transmit sound, especially speech, over a distance"
        ),
        Definition(
            word: "sky",
            definition: "The region of the atmosphere and outer space seen from the earth"
        ),
        Definition(
            word: "flower",
            definition: "The seed-bearing part of a plant, consisting of reproductive organs surrounded by colorful petals"
        ),
        Definition(
            word: "summer",
            definition: "The warmest season of the year, following spring and preceding autumn"
        ),
        Definition(
            word: "peace",
            definition: "Freedom from disturbance; tranquility or a state of mutual harmony between people or groups"
        ),
        Definition(
            word: "doctor",
            definition: "A qualified practitioner of medicine; a physician"
        ),
        Definition(
            word: "beach",
            definition: "A pebbly or sandy shore, especially by the sea between high and low water marks"
        ),
        Definition(
            word: "snow",
            definition: "Atmospheric water vapor frozen into ice crystals and falling in light white flakes"
        ),
        Definition(
            word: "river",
            definition: "A large natural stream of water flowing in a channel to the sea, a lake, or another such stream"
        ),
        Definition(
            word: "movie",
            definition: "A story or event recorded by a camera as a set of moving images"
        ),
        Definition(
            word: "dance",
            definition: "Move rhythmically to music, typically following a set sequence of steps"
        ),
        Definition(
            word: "garden",
            definition: "A piece of ground, often near a house, used for growing flowers, fruit, or vegetables"
        ),
        Definition(
            word: "morning",
            definition: "The period of time from sunrise to noon"
        ),
        Definition(
            word: "memory",
            definition: "The faculty by which the mind stores and remembers information"
        ),
        Definition(
            word: "forest",
            definition: "A large area covered chiefly with trees and undergrowth"
        ),
        Definition(
            word: "game",
            definition: "An activity engaged in for diversion or amusement, often with rules"
        ),
        Definition(
            word: "rain",
            definition: "Water that falls in drops from clouds in the sky"
        ),
        Definition(
            word: "freedom",
            definition: "The power or right to act, speak, or think as one wants without hindrance or restraint"
        ),
        Definition(
            word: "chocolate",
            definition: "A food preparation made from roasted and ground cacao seeds"
        ),
        Definition(
            word: "library",
            definition: "A building or room containing collections of books, periodicals, and sometimes films for use or borrowing"
        ),
        Definition(
            word: "mountain",
            definition: "A large natural elevation of the earth's surface rising abruptly from the surrounding level"
        ),
        Definition(
            word: "island",
            definition: "A piece of land surrounded by water"
        ),
        Definition(
            word: "diamond",
            definition: "A precious gemstone consisting of a clear and colorless crystalline form of pure carbon"
        ),
        Definition(
            word: "rocket",
            definition: "A cylindrical projectile that can be propelled to a great height or distance by the combustion of its contents"
        ),
        Definition(
            word: "rainbow",
            definition: "An arch of colors formed in the sky caused by the refraction and dispersion of the sun's light by rain or other water droplets"
        ),
        Definition(
            word: "castle",
            definition: "A large building, typically of the medieval period, fortified against attack with thick walls and towers"
        ),
        Definition(
            word: "elephant",
            definition: "A very large plant-eating mammal with a prehensile trunk, long curved ivory tusks, and large ears"
        )
    ]
    
    static let recipes: [Recipe] = [
        Recipe(
            title: "Classic Margherita Pizza",
            difficulty: "Medium",
            isVegetarian: true,
            ingredients: [
                Ingredient(name: "Pizza Dough", amount: "1 ball"),
                Ingredient(name: "San Marzano Tomatoes", amount: "1 can (14 oz)"),
                Ingredient(name: "Fresh Mozzarella", amount: "8 oz"),
                Ingredient(name: "Fresh Basil", amount: "10 leaves"),
                Ingredient(name: "Olive Oil", amount: "2 tbsp"),
                Ingredient(name: "Salt", amount: "1/2 tsp")
            ]
        ),
        Recipe(
            title: "Chocolate Chip Cookies",
            difficulty: "Easy",
            isVegetarian: true,
            ingredients: [
                Ingredient(name: "All-Purpose Flour", amount: "2 1/4 cups"),
                Ingredient(name: "Baking Soda", amount: "1 tsp"),
                Ingredient(name: "Salt", amount: "1 tsp"),
                Ingredient(name: "Butter", amount: "1 cup"),
                Ingredient(name: "Brown Sugar", amount: "3/4 cup"),
                Ingredient(name: "Granulated Sugar", amount: "3/4 cup"),
                Ingredient(name: "Vanilla Extract", amount: "1 tsp"),
                Ingredient(name: "Eggs", amount: "2 large"),
                Ingredient(name: "Chocolate Chips", amount: "2 cups")
            ]
        ),
        Recipe(
            title: "Chicken Stir Fry",
            difficulty: "Medium",
            isVegetarian: false,
            ingredients: [
                Ingredient(name: "Chicken Breast", amount: "1 lb"),
                Ingredient(name: "Broccoli", amount: "2 cups"),
                Ingredient(name: "Carrots", amount: "2 medium"),
                Ingredient(name: "Bell Peppers", amount: "2"),
                Ingredient(name: "Soy Sauce", amount: "3 tbsp"),
                Ingredient(name: "Garlic", amount: "3 cloves"),
                Ingredient(name: "Ginger", amount: "1 tbsp"),
                Ingredient(name: "Vegetable Oil", amount: "2 tbsp"),
                Ingredient(name: "Cornstarch", amount: "1 tbsp")
            ]
        ),
        Recipe(
            title: "Guacamole",
            difficulty: "Easy",
            isVegetarian: true,
            ingredients: [
                Ingredient(name: "Avocados", amount: "3 ripe"),
                Ingredient(name: "Lime Juice", amount: "1 tbsp"),
                Ingredient(name: "Red Onion", amount: "1/4 cup"),
                Ingredient(name: "Cilantro", amount: "2 tbsp"),
                Ingredient(name: "Jalapeno", amount: "1 small"),
                Ingredient(name: "Tomato", amount: "1 medium"),
                Ingredient(name: "Salt", amount: "1/2 tsp"),
                Ingredient(name: "Garlic", amount: "1 clove")
            ]
        ),
        Recipe(
            title: "Beef Lasagna",
            difficulty: "Hard",
            isVegetarian: false,
            ingredients: [
                Ingredient(name: "Ground Beef", amount: "1 lb"),
                Ingredient(name: "Lasagna Noodles", amount: "12 sheets"),
                Ingredient(name: "Ricotta Cheese", amount: "15 oz"),
                Ingredient(name: "Mozzarella Cheese", amount: "2 cups"),
                Ingredient(name: "Parmesan Cheese", amount: "1/2 cup"),
                Ingredient(name: "Marinara Sauce", amount: "24 oz"),
                Ingredient(name: "Egg", amount: "1 large"),
                Ingredient(name: "Italian Seasoning", amount: "1 tbsp"),
                Ingredient(name: "Garlic", amount: "2 cloves"),
                Ingredient(name: "Onion", amount: "1 medium")
            ]
        ),
        Recipe(
            title: "Vegetable Curry",
            difficulty: "Medium",
            isVegetarian: true,
            ingredients: [
                Ingredient(name: "Potatoes", amount: "2 large"),
                Ingredient(name: "Cauliflower", amount: "1 head"),
                Ingredient(name: "Carrots", amount: "2 medium"),
                Ingredient(name: "Peas", amount: "1 cup"),
                Ingredient(name: "Coconut Milk", amount: "1 can (14 oz)"),
                Ingredient(name: "Curry Powder", amount: "2 tbsp"),
                Ingredient(name: "Ginger", amount: "1 tbsp"),
                Ingredient(name: "Garlic", amount: "3 cloves"),
                Ingredient(name: "Vegetable Broth", amount: "1 cup"),
                Ingredient(name: "Onion", amount: "1 large")
            ]
        ),
        Recipe(
            title: "Banana Bread",
            difficulty: "Easy",
            isVegetarian: true,
            ingredients: [
                Ingredient(name: "Ripe Bananas", amount: "3"),
                Ingredient(name: "All-Purpose Flour", amount: "2 cups"),
                Ingredient(name: "Baking Soda", amount: "1 tsp"),
                Ingredient(name: "Salt", amount: "1/4 tsp"),
                Ingredient(name: "Butter", amount: "1/2 cup"),
                Ingredient(name: "Brown Sugar", amount: "3/4 cup"),
                Ingredient(name: "Eggs", amount: "2 large"),
                Ingredient(name: "Vanilla Extract", amount: "1 tsp"),
                Ingredient(name: "Walnuts", amount: "1/2 cup (optional)")
            ]
        ),
        Recipe(
            title: "Grilled Salmon",
            difficulty: "Medium",
            isVegetarian: false,
            ingredients: [
                Ingredient(name: "Salmon Fillets", amount: "4 (6 oz each)"),
                Ingredient(name: "Olive Oil", amount: "2 tbsp"),
                Ingredient(name: "Lemon", amount: "1"),
                Ingredient(name: "Garlic", amount: "2 cloves"),
                Ingredient(name: "Dill", amount: "1 tbsp"),
                Ingredient(name: "Salt", amount: "1 tsp"),
                Ingredient(name: "Black Pepper", amount: "1/2 tsp")
            ]
        ),
        Recipe(
            title: "Pancakes",
            difficulty: "Easy",
            isVegetarian: true,
            ingredients: [
                Ingredient(name: "All-Purpose Flour", amount: "2 cups"),
                Ingredient(name: "Baking Powder", amount: "2 tsp"),
                Ingredient(name: "Sugar", amount: "2 tbsp"),
                Ingredient(name: "Salt", amount: "1/2 tsp"),
                Ingredient(name: "Milk", amount: "1 1/2 cups"),
                Ingredient(name: "Eggs", amount: "2 large"),
                Ingredient(name: "Butter", amount: "1/4 cup, melted"),
                Ingredient(name: "Vanilla Extract", amount: "1 tsp")
            ]
        ),
        Recipe(
            title: "Spaghetti Carbonara",
            difficulty: "Medium",
            isVegetarian: false,
            ingredients: [
                Ingredient(name: "Spaghetti", amount: "1 lb"),
                Ingredient(name: "Pancetta or Bacon", amount: "8 oz"),
                Ingredient(name: "Eggs", amount: "4 large"),
                Ingredient(name: "Parmesan Cheese", amount: "1 cup, grated"),
                Ingredient(name: "Black Pepper", amount: "1 tsp"),
                Ingredient(name: "Garlic", amount: "2 cloves"),
                Ingredient(name: "Salt", amount: "to taste")
            ]
        )
    ]
}
