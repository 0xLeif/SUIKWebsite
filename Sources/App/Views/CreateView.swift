import Plot

struct CreateView: View {
    var body: Node<HTML.BodyContext> {
        .div(
            .h1("My website"),
            .p("Writing HTML in Swift is pretty great!"),
            .form(
                .method(.post),
                .action("/example"),
                .fieldset(
                    .label(.for("title"), "Title"),
                    .input(
                        .required(true),
                        .name("title"),
                        .type(.text)
                    ),
                    .br(),
                    .label(.for("description"), "Description"),
                    .input(
                        .required(false),
                        .name("description"),
                        .type(.text)
                    ),
                    .br(),
                    .label(.for("imageURL"), "Image URL"),
                    .input(
                        .required(true),
                        .name("imageURL"),
                        .type(.url)
                    ),
                    .br(),
                    .label(.for("codeURL"), "Code URL"),
                    .input(
                        .required(true),
                        .name("codeURL"),
                        .type(.url)
                    )
                ),
                .input(.type(.submit), .value("Create"))
            )
        )
        
    }
}
