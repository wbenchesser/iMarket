//
//  ProductService.swift
//  iMarket
//
//  Created by Ben Chesser on 8/23/24.
//

import Foundation

class ProductService: ObservableObject {
    private static let decoder = JSONDecoder()
    
    static func fetchProducts() async throws -> [Product] {
        guard let url = URL(string: "https://dummyjson.com/products") else {
            fatalError("Invalid URL")
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoded = try decoder.decode(Welcome.self, from: data)
        
        return decoded.products
    }
}
