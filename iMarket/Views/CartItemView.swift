//
//  CartView.swift
//  iMarket
//
//  Created by Ben Chesser on 8/24/24.
//

import SwiftUI

struct CartItemView: View {
    @EnvironmentObject var viewModel: ProductViewModel

    var body: some View {
        List(viewModel.cart) { product in
            HStack {
                if let url = URL(string: product.images[0]) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .clipShape(Rectangle())
                        case .failure(_):
                            Text("Failed to load image")
                                .frame(width: 40, height: 40)
                        case .empty:
                            ProgressView()
                                .frame(width: 40, height: 40)
                        @unknown default:
                            Text("Unknown error")
                                .frame(width: 40, height: 40)
                        }
                    }
                    .frame(width: 40, height: 40)
                } else {
                    Text("Invalid image URL")
                        .frame(width: 128, height: 128)
                }
                
                Text(product.title)
                    .font(.subheadline)
                    .frame(width: 175, height: 10)
                    .truncationMode(.tail)
                
                Spacer()
                
                Text("$" + String(product.price))
                    .font(.title3)
                    .fontWeight(.bold)
            }
            .background(Color(UIColor.systemGray6))
            .cornerRadius(10)
            .listRowBackground(Color.clear)
        }
        .listStyle(PlainListStyle())
        .background(Color(UIColor.systemGray6))
        .scrollContentBackground(.hidden)
        .navigationTitle("Cart")
    }
}

#Preview {
    CartItemView()
}
