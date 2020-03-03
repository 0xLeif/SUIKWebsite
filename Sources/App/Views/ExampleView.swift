import Plot

struct ExampleView: View {
    let example: Example
    
    var body: Node<HTML.BodyContext> {
        .div(
            .img(
                .src(example.imageURL)
            ),
            .h1("\(example.title)"),
            .unwrap(example.description, Node.text),
            .a(.href(example.codeURL), .p("Source Code"))
        )
    }
}
