//
//  ProductViewModel.swift
//  iMarket
//
//  Created by Ben Chesser on 8/24/24.
//

import Foundation
import Combine

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var saved: [Product] = []
    @Published var cart: [Product] = []
    @Published var isLoading = false
    @Published var error: Error?
    @Published var searchQuery: String = ""
    
    var filteredProducts: [Product] {
        if searchQuery.isEmpty {
            return products
        } else {
            return products.filter { $0.title.lowercased().contains(searchQuery.lowercased()) }
        }
    }
    
    func fetchProducts() {
        isLoading = true
        Task {
            do {
                let response = try await ProductService.fetchProducts()
                DispatchQueue.main.async {
                    self.products = response
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.error = error
                    self.isLoading = false
                }
            }
        }
    }
    
    func addToCart(product: Product) {
        cart.append(product)
    }
    
    func clearCart() {
        cart.removeAll()
    }
    
    func toggleSaved(product: Product) {
        if saved.contains(where: { $0.id == product.id }) {
            saved.removeAll { $0.id == product.id }
        } else {
            saved.append(product)
        }
    }

}
