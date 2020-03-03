import Vapor
import Plot

/// Controls basic CRUD operations on `Example`s.
final class ExampleController: RouteCollection {
    func boot(router: Router) throws {
        router.post("example", use: create)
        router.get("examples", use: index)
        router.delete("delete", Example.parameter, use: delete)
    }
    
    /// Returns a list of all `Example`s.
    func index(_ req: Request) throws -> Future<Response> {
        return Example.query(on: req).all()
            .flatMap { values in
                
                try HTML(
                    .head(
                        .title("My website"),
                        .stylesheet("styles.css")
                    ),
                    .body(
                        .forEach(values) {
                            ExampleView(example: $0).body
                        }
                    )
                    
                )
                    .encode(for: req)
        }
    }
    
    /// Saves a decoded `Example` to the database.
    func create(_ req: Request) throws -> Future<Example> {
        return try req.content.decode(Example.self).flatMap { example in
            return example.save(on: req)
        }
    }
    
    /// Deletes a parameterized `Example`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Example.self).flatMap { example in
            return example.delete(on: req)
        }.transform(to: .ok)
    }
}
