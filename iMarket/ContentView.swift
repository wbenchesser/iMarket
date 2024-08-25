//
//  ContentView.swift
//  iMarket
//
//  Created by Ben Chesser on 8/23/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ProductViewModel()
    
    var body: some View {
        TabView {
            NavigationView {
                ItemListView()
            }
            .tabItem {
                Image(systemName: "carrot.fill")
                Text("Products")
            }
            
            NavigationView {
                SavedItemsView()
            }
            .tabItem {
                Image(systemName: "heart.fill")
                Text("My Items")
            }
            
            NavigationView {
                CartView()
            }
            .tabItem {
                Image(systemName: "cart.fill")
                Text(viewModel.cart.isEmpty ? "Cart" : "Cart (\(viewModel.cart.count))" )
                
            }
        }
        .background(Color(UIColor.systemGray6))
        .accentColor(.blue)
        .environmentObject(viewModel)
        .onAppear { // Basically allows UIKit functionality?
            UITabBar.appearance().barTintColor = UIColor.systemGray6
        }
    }
}

#Preview {
    ContentView()
}
