import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = RecetaViewModel()
    
    var body: some View {
        NavigationView {
            ProductoListView(viewModel: viewModel)
        }
    }
}
#Preview {
    ContentView()
}
