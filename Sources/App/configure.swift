import Fluent
import FluentPostgresDriver
import Leaf
import NIOSSL
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // Set unp leaf
    app.views.use(.leaf)

    if let databaseURL = Environment.get("DATABASE_URL") {
        try app.databases.use(.postgres(url: databaseURL), as: .psql)
    } else {
        let localConfig = SQLPostgresConfiguration(
            hostname: "localhost",
            port: 5432,
            username: "postgres",
            password: "",
            database: "apisamuelshi",
            tls: .disable
        )
        app.databases.use(.postgres(configuration: localConfig), as: .psql)
    }

    // Todo migrations
    app.migrations.add(CreateTodo())
    
    // Notes app migrations
    app.migrations.add(CreateNotesTable())
    
    // Nicknack migrations
    app.migrations.add(CreateCommunities())
    app.migrations.add(CreatePosts())
    app.migrations.add(CreateVotes())
    app.migrations.add(CreateCommunityMembers())

    // Run migrations on startup
    try await app.autoMigrate()

    // register routes
    try routes(app)
}
