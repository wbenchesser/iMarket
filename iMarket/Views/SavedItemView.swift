//
//  SavedItemView.swift
//  iMarket
//
//  Created by Ben Chesser on 8/24/24.
//

import SwiftUI

struct SavedItemsView: View {
    @EnvironmentObject var viewModel: ProductViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Divider()
                .padding(.top, 10)
            
                Text("Showing \(viewModel.saved.count) saved items.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    .padding(.bottom, 8)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(viewModel.saved) { product in
                        ItemView(product: product)
                    }
                }
                .padding()
            }
        }
        .background(Color(UIColor.systemGray6))
        .navigationTitle("Saved")
    }
}

#Preview {
    SavedItemsView()
}

