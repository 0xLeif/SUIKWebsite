import Plot

struct ExampleView: View {
    let example: Example
    
    var body: Node<HTML.BodyContext> {
        .div(
            .div(
                .img(
                    .src(example.imageURL)
                ),
                .h1("\(example.title)"),
                .unwrap(example.description, Node.text),
                .a(.href(example.codeURL), .p("Source Code"))
            ),
            example.id.map { 
                .div(
                    .id("right-div"),
                    .form(
                        .method(.post),
                        .action("delete/\($0)"),
                        .button(.text("Delete"))
                    )
                )
            } ?? .br()
        )
    }
}
