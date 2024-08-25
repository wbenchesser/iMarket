//
//  ItemListView.swift
//  iMarket
//
//  Created by Ben Chesser on 8/24/24.
//

import SwiftUI

struct ItemListView: View {
    @StateObject private var viewModel = ProductViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            SearchBar(text: $viewModel.searchQuery)
                .padding(.horizontal)
            
            Divider()
                .padding(.top, 10)
            
            if !viewModel.searchQuery.isEmpty {
                Text("\(String(viewModel.filteredProducts.count)) results for \"\(viewModel.searchQuery)\"")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    .padding(.bottom, 8)
            }
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(viewModel.filteredProducts) { product in
                        ItemView(product: product)
                    }
                }
                .padding()
            }
        }
        .background(Color(UIColor.systemGray6))
        .onAppear {
            viewModel.fetchProducts()
        }
    }
}

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.primary)
            
            TextField("What are you looking for?", text: $text)
                .padding(7)
                .cornerRadius(8)
        }
        .padding(.horizontal, 10)
        .background(Color(.systemGray4))
        .cornerRadius(100)
    }
}

#Preview {
    ItemListView()
}
