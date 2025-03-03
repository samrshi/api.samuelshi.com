import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        try await req.view.render("index", ["title": "Sam's API!"])
    }

    app.get("hello") { req in
        "Hello, world!"
    }

    try app.register(collection: TodoRoutes())
    try app.register(collection: RandomRoutes())
    try app.register(collection: BasketballRoutes())
    try app.register(collection: WeatherRoutes())
}
