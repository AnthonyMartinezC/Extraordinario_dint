

import SwiftUI

struct ProductoListView: View {
    @StateObject var viewModel: RecetaViewModel
    @State private var selectedRecipe = "easy"
    let recipes = ["easy", "medium"]
    
    var body: some View {
        TabView(selection: $selectedRecipe) {
            ForEach(recipes, id: \ .self) { difficulty in
                VStack {
                    if viewModel.isLoading {
                        ProgressView("Cargando...")
                    } else if let error = viewModel.errorMessage {
                        Text("Error: \(error)").foregroundColor(.red)
                    } else {
                        if !viewModel.recetas.isEmpty {
                            Text("Recetas encontradas: \(viewModel.total)")
                                .font(.headline)
                                .padding(.bottom, 4)
                        }

                        List(viewModel.recetas) { recetas in
                            NavigationLink(destination:RecetaDetalleView(receta: <#T##Receta#>)) {
                                HStack {
                                    AsyncImage(url: URL(string: Receta.image)) { image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 50, height: 50)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    
                                    VStack(alignment: .leading) {
                                        Text(recetas.name).font(.headline)
                                        Text("\(recetas.name, specifier: "%.2f") €").font(.subheadline)
                                    }
                                }
                            }
                        }
                    }
                }
                .tabItem {
                    Image(systemName: icon(for: difficulty))
                    Text(difficulty.capitalized)
                }
                .tag(difficulty)
                .onAppear {
                    viewModel.fetchProducts(category: difficulty)
                }
            }
        }
    }
    //los iconos para dificultad
    func icon(for difficulty: String) -> String {
        switch difficulty {
        case "easy": return "arrow.up.circle.fill"
        case "medium": return "arrow.up.down.circle.fill"
        default: return "questionmark"
        }
    }
}
