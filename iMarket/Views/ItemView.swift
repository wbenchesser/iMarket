//
//  ItemView.swift
//  iMarket
//
//  Created by Ben Chesser on 8/23/24.
//

import SwiftUI

struct ItemView: View {
    @EnvironmentObject var viewModel: ProductViewModel
    let product: Product

    var body: some View {
        HStack {
            if let url = URL(string: product.images[0]) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 128, height: 128)
                            .clipShape(Rectangle())
                    case .failure(_):
                        Text("Failed to load image")
                            .frame(width: 128, height: 128)
                    case .empty:
                        ProgressView()
                            .frame(width: 128, height: 128)
                    @unknown default:
                        Text("Unknown error")
                            .frame(width: 128, height: 128)
                    }
                }
                .frame(width: 128, height: 128)
            } else {
                Text("Invalid image URL")
                    .frame(width: 128, height: 128)
            }

            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.headline)
                    .frame(height: 22)
                    .truncationMode(.tail)

                Text("$" + String(product.price))
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(height: 24)

                Text(product.category.rawValue.capitalized)
                    .font(.subheadline)
                    .padding(4)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color(UIColor.systemGray4))
                    )

                HStack {
                    Button(action: {
                        viewModel.addToCart(product: product)
                    }) {
                        RoundedRectangle(cornerRadius: 100)
                            .fill(.blue)
                            .frame(width: 174, height: 36)
                            .overlay(
                                Text("Add to Cart")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            )
                    }

                    Button(action: {
                        viewModel.toggleSaved(product: product)
                    }) {
                        Image(systemName: viewModel.saved.contains { $0.id == product.id } ? "heart.fill" : "heart")
                            .resizable()
                            .padding(9)
                            .scaledToFit()
                            .frame(width: 36, height: 36)
                            .foregroundColor(.primary)
                            .background(
                                Circle()
                                    .fill(Color(UIColor.systemGray4))
                            )
                    }
                }
            }
        }
    }
}
