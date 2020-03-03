import Plot

protocol View {

    var body: Node<HTML.BodyContext> { get }
    
}