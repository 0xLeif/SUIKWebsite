import Plot

struct ExampleView: View {
    var body: HTML {
        HTML(
            .head(
                .title("My website"),
                .stylesheet("styles.css")
            ),
            .body(
                .div(
                    .img(
                        .src("https://raw.githubusercontent.com/0xLeif/awesome-swiftuikit/master/assets/BrandedLoadingView.gif")
                    ),
                    .h1("My website"),
                    .p("Writing HTML in Swift is pretty great!")
                )
            )
        )
    }
}