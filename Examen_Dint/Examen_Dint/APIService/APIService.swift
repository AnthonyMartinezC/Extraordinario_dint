//
//  APIService.swift
//  entrenamientoExamen
//
//  Created by Anthony Leonidas Martinez Campoverde on 24/6/25.
//



import Foundation

class APIService {
    static let shared = APIService()
    private let baseURL = "https://dummyjson.com/recipes"
    
    func fetchProducts(id: String, completion: @escaping (Result<[Receta], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)\("")") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async { completion(.failure(error)) }
                return
            }
            
            guard let data = data else { return }
            
            do {
                let products = try JSONDecoder().decode([Receta].self, from: data)
                DispatchQueue.main.async { completion(.success(products)) }
            } catch {
                DispatchQueue.main.async { completion(.failure(error)) }
            }
        }.resume()
    }
}

