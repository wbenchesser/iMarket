//
//  CartView.swift
//  iMarket
//
//  Created by Ben Chesser on 8/24/24.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var viewModel: ProductViewModel
    @State private var isPickUp = true

    var totalPrice: Double {
        viewModel.cart.reduce(0) { $0 + $1.price }
    }

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    isPickUp.toggle()
                }) {
                    Text(isPickUp ? "Pick up" : "Delivery")
                        .foregroundColor(.primary)
                        .fontWeight(.bold)
                    Image(systemName: "chevron.down")
                        .foregroundColor(.primary)
                        .fontWeight(.bold)
                }
                Text("from")
                    .foregroundColor(.secondary)
                    .padding(.leading, 5)
                Text("Cupertino")
                    .fontWeight(.bold)
                    .underline()
                Spacer()
            }
            .padding(.leading, 16)

            CartItemView()

            Spacer()

            RoundedRectangle(cornerRadius: 10)
                .fill(Color(UIColor.systemGray4))
                .frame(height: 80)
                .padding(.horizontal)
                .overlay(
                    VStack() {
                        HStack {
                            Text(String(format: "$%.2f", totalPrice) + " total")
                                .font(.title3)
                                .fontWeight(.bold)
                                .padding(.top, 10)
                                .padding(.leading, 30)
                            
                            Spacer()
                        }
                        
                        HStack {
                            Text(String(viewModel.cart.count) + " items")
                                .font(.caption)
                                .padding(.bottom, 10)
                                .padding(.leading, 30)
                            
                            Spacer()
                        }
                    }
                )
                .padding(.bottom, 16)

            Button(action: {
                viewModel.clearCart()
            }) {
                RoundedRectangle(cornerRadius: 100)
                    .fill(.blue)
                    .frame(width: 360, height: 36)
                    .overlay(
                        Text("Check out")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    )
                    .padding(.bottom, 16)
            }
        }
        .background(Color(UIColor.systemGray6))
        .navigationTitle("Cart")
    }
}

// #Preview {
//    CartView()
// }
