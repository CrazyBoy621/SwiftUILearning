//
//  Init+Learning.swift
//  SwiftUILearning
//
//  Created by Shohjahon Rakhmatov on 11/04/25.
//

import SwiftUI

struct Init_Learning: View {
    
    init() {
        print("initialized")
    }
    
    @State private var isPresented = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Button("Go another view") {
                    isPresented = true
                }
//                NavigationLink("Go another view") {
//                    NewView()
//                }
            }
            .onAppear {
                
            }
            .onAppear {
                print("Appeared")
            }
            .navigationDestination(isPresented: $isPresented) {
                NewView()
            }
        }
    }
}

struct NewView: View {
    
    init() {
        print("initialized NewView")
    }
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct TabsView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}

struct HomeView: View {
    
    init() {
        print("Home initialized")
    }
    
    var body: some View {
        Text("Home")
            .onAppear {
                print("Home appeared")
            }
    }
}

struct SearchView: View {
    
    init() {
        print("Search initialized")
    }
    
    var body: some View {
        Text("Search")
            .onAppear {
                print("Search appeared")
            }
    }
}

#Preview {
    Init_Learning()
}
#Preview {
    TabsView()
}
