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
               .a(.href("example"), .p("Add An Example")),
               .a(.href("examples"), .p("View Examples"))
           )
       ).encode(for: req)
   }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    router.get("example") { req in
        return try HTML(
            .head(
                .title("My website"),
                .stylesheet("styles.css")
            ),
            .body(
                CreateView().body
            )
        ).encode(for: req)
    }
    
    try router.register(collection: ExampleController())
}
