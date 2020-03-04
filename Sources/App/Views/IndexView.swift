import Plot

struct IndexView: View {
    let examples: [Example]
    
    var body: Node<HTML.BodyContext> {
        .div(
            .h1("Examples"),
            .div(
                .a(
                    .href("example"),
                    .p("Add New Example")
                )
            ),
            .forEach(examples) {
                ExampleView(example: $0).body
            }
        )
    }
}