//
//  BadgeView.swift
//  iMarket
//
//  Created by Ben Chesser on 8/24/24.
//

import SwiftUI

struct BadgeView: View {
    var number: Int
    
    var body: some View {
        ZStack {
            if number > 0 {
                Text("\(number)")
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(4)
                    .background(.red)
                    .clipShape(Circle())
                    .offset(x: 10, y: -10)
            }
        }
    }
}

#Preview {
    BadgeView(number: 1)
}
