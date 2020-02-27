import Vapor

/// Controls basic CRUD operations on `Example`s.
final class ExampleController {
    /// Returns a list of all `Example`s.
    func index(_ req: Request) throws -> Future<[Example]> {
        return Example.query(on: req).all()
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
