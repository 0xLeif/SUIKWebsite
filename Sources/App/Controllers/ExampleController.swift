import Vapor
import Plot

struct BadExampleID: Error {                                                                                                                                                                                                                                   
    let description = "BadID"
}


/// Controls basic CRUD operations on `Example`s.
final class ExampleController: RouteCollection {
    func boot(router: Router) throws {        
        router.get(use: index)
        router.post("example", use: create)
        router.post("delete", Example.parameter, use: delete)

        router.get("example") {
            try HTML(
                .head(
                    .title("My website"),
                    .stylesheet("styles.css")
                ),
                .body(
                    CreateView().body
                )
            ).encode(for: $0)
        }
    }
    
    /// Returns a list of all `Example`s.
    func index(_ req: Request) throws -> Future<Response> {
        Example.query(on: req).all()
            .flatMap { 
            try HTML(
                .head(
                    .title("My website"),
                    .stylesheet("styles.css")
                ),
                .body(
                    .if($0.isEmpty, .h3("Oh No! There are no examples...")),
                    IndexView(examples: $0).body
                )
            ).encode(for: req)
        }
    }
    
    /// Saves a decoded `Example` to the database.
    func create(_ req: Request) throws -> Future<Response> {
        try req.content.decode(Example.self)
        .flatMap { example in
            example.save(on: req)
        }
        .map { _ in  
            req.redirect(to: "/")
        }
    }
    
    /// Deletes a parameterized `Example`.
    func delete(_ req: Request) throws -> Future<Response> {
        try req.parameters.next(Example.self)
        .flatMap { example in
            example.delete(on: req)
        }
        .map { _ in
            req.redirect(to: "/")
        }
    }
}
