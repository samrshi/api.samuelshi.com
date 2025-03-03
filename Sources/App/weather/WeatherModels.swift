//
//  WeatherModels.swift
//  api
//
//  Created by Samuel Shi on 3/2/25.
//

import Vapor

struct Temperatures: Content {
    var current: Int
    var high: Int
    var low: Int
}

struct CurrentWeatherResponse: Content {
    var location: String
    var time: String
    var condition: String
    var temperatures: Temperatures
}

struct HourlyForecastItem: Content {
    var time: String
    var temperature: Int
}
