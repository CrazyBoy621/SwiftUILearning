//
//  CustomTabView.swift
//  SwiftUILearning
//
//  Created by Shohjahon Rakhmatov on 23/04/25.
//

import SwiftUI

struct CustomTabView: View {
    var body: some View {
        VStack(spacing: 0) {
            TabView {
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
                .toolbar(.hidden, for: .tabBar)
                Text("2")
                Text("3")
                Text("4")
                Text("5")
            }
            HStack {
                Button {
                    
                } label: {
                    VStack {
                        Image(.homeTabIcon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 23, height: 23)
                        Text("Home")
                    }
                }
                Button {
                    
                } label: {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
            }
        }
    }
}

#Preview {
    CustomTabView()
}
