//
//  Tab+Learning.swift
//  SwiftUILearning
//
//  Created by Shohjahon Rakhmatov on 23/04/25.
//

import SwiftUI

struct Tab_Learning: View {
    
    @State private var selectedTab: String = "1"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                ScrollView {
                    NavigationLink("Go to new view") {
                        
                    }
                    Rectangle()
                        .fill(Color.red)
                        .frame(height: 800)
                }
                .navigationTitle("Title")
                .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                VStack {
                    Text("Home")
                    Image(.homeTabIcon)
                }
            }
            Text("2")
                .tabItem {
                    VStack {
                        Text("Search")
                        Image(systemName: "magnifyingglass")
                    }
                }
            Text("3")
                .tabItem {
                    VStack {
                        Text("Search")
                        Image(systemName: "magnifyingglass")
                    }
                }
            Text("4")
                .tabItem {
                    VStack {
                        Text("Search")
                        Image(systemName: "magnifyingglass")
                    }
                }
            Text("5")
                .tabItem {
                    VStack {
                        Text("Search")
                        Image(systemName: "magnifyingglass")
                    }
                }
        }
//        .onChange(of: selectedTab) { newValue in
//            print(newValue)
//        }
//        TabView {
////                .tabItem {
////                    Label("Home", systemImage: "house")
////                }
////                .tabItem {
////                    Label("Search", systemImage: "magnifyingglass")
////                }
//        }
    }
}

#Preview {
    Tab_Learning()
}
