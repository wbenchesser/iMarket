//
//  test.swift
//  iMarket
//
//  Created by Ben Chesser on 8/24/24.
//

import SwiftUI

struct test: View {
    @State private var isPickUp: Bool = false
    var body: some View {
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
    }
}

#Preview {
    test()
}
