import FluentSQLite
import Vapor

/// A single entry of a Example list.
final class Example: SQLiteModel {
    /// The unique identifier for this `Example`.
    var id: Int?

    /// A title describing what this `Example` entails.
    var title: String
    var imageURL: String
    var codeURL: String
    var description: String?

    /// Creates a new `Example`.
    init(id: Int? = nil, title: String, imageURL: String, codeURL: String, description: String? = nil) {
        self.id = id
        self.title = title
        self.imageURL = imageURL
        self.codeURL = codeURL
        self.description = description
    }
}

/// Allows `Example` to be used as a dynamic migration.
extension Example: Migration { }

/// Allows `Example` to be encoded to and decoded from HTTP messages.
extension Example: Content { }

/// Allows `Example` to be used as a dynamic parameter in route definitions.
extension Example: Parameter { }
