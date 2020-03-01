import Plot

struct ExampleView: View {
    var body: Node<HTML.BodyContext> {
        .div(
            .img(
                .src("https://raw.githubusercontent.com/0xLeif/awesome-swiftuikit/master/assets/BrandedLoadingView.gif")
            ),
            .h1("My website"),
            .p("Writing HTML in Swift is pretty great!")
        )
            
    }
}