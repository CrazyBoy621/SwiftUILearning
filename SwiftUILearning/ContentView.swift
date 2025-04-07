//
//  ContentView.swift
//  SwiftUILearning
//
//  Created by Shohjahon Rakhmatov on 07/04/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("Content")
                NavigationLink {
                    NavigationStack {
                        Text("This is new UI")
                    }
                } label: {
                    Text("New UI")
                }
            }
            .frame(maxWidth: .infinity)
            .border(.red)
            .navigationTitle("Title")
        }
    }
}

#Preview {
    ContentView()
}

