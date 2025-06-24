import Foundation

class RecetaViewModel: ObservableObject {
    @Published var recetas: [Receta] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var total: Int = 0

    
    func fetchProducts(difficulty: String) {
        isLoading = true
        errorMessage = nil
        
        APIService.shared.fetchProducts(id: difficulty) { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let recetas):
                    self.recetas = recetas
                    self.total = recetas.count

                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
