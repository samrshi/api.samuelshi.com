//
//  WeatherRoutes.swift
//  api
//
//  Created by Samuel Shi on 2/26/25.
//

import Vapor

struct WeatherRoutes: RouteCollection {
    func boot(routes: any RoutesBuilder) throws {
        let routes = routes.grouped("weather")
        routes.get("current") { current(request: $0) }
        routes.get("hourly") { hourly(request: $0) }
    }
    
    func current(request: Request) -> CurrentWeatherResponse {
        CurrentWeatherResponse(
            location: "Chapel Hill, NC",
            time: "11am",
            condition: "Sunny",
            temperatures: Temperatures(current: 46, high: 53, low: 28)
        )
    }
    
    func hourly(request: Request) -> [HourlyForecastItem] {
        return [
            .init(time: "12pm", temperature: 49),
            .init(time: "1pm", temperature: 51),
            .init(time: "2pm", temperature: 53),
            .init(time: "3pm", temperature: 53),
            .init(time: "4pm", temperature: 53),
            .init(time: "5pm", temperature: 53),
            .init(time: "6pm", temperature: 48),
            .init(time: "7pm", temperature: 45),
            .init(time: "8pm", temperature: 43),
            .init(time: "9pm", temperature: 42),
            .init(time: "10pm", temperature: 40),
            .init(time: "11pm", temperature: 38),
        ]
    }
}
