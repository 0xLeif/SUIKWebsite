import Vapor
import Plot

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    // Basic "It works" example
    router.get { req in
        try HTML(
            .head(
                .title("My website"),
                .stylesheet("styles.css")
            ),
            .body(
                .div(
                    .h1("My website"),
                    .p("Writing HTML in Swift is pretty great!")
                )
            )
        ).encode(for: req)
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
}
