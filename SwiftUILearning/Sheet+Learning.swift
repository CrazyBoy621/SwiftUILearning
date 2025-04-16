//
//  Sheet+Learning.swift
//  SwiftUILearning
//
//  Created by Shohjahon Rakhmatov on 16/04/25.
//

import SwiftUI

struct Sheet_Learning: View {
    
    @State private var showSheet: Bool = true
    @State private var selectedItem: Item?
    @State private var text: String?
    
    var body: some View {
        ScrollView {
            Button("Hello") {
                
            }
            Button("Show Sheet") {
    //            selectedItem = Item(title: "Salom")
                text = "Salom"
                self.showSheet = true
            }
        }
        .overlay(alignment: .bottom) {
            Rectangle()
                .fill(Color.blue)
                .frame(height: 200)
                .frame(maxWidth: .infinity)
        }
//        .sheet(isPresented: $showSheet) {
//            print("Dimissed")
//        } content: {
//            ScrollView {
//                Text(text ?? "nil")
//            }
//        }
        .sheet(item: $selectedItem) { item in
            ScrollView {
                Text(item.title ?? "Hello")
            }
        }
//        .sheet(isPresented: $showSheet) {
//            ScrollView {
//                Text(text ?? "nil")
//            }
//            .presentationDragIndicator(.visible)
////            .presentationDetents([.medium, .fraction(0.75), .large])
//            .presentationDetents([.large])
//        }
        .sheet(isPresented: $showSheet) {
            SheetView()
        }
    }
}

struct SheetView: View {
    var body: some View {
        if #available(iOS 16.4, *) {
            NavigationStack {
                ScrollView {
                    Rectangle()
                        .fill(.red)
                        .frame(height: 300)
                }
//                .background(.ultraThinMaterial)
                .navigationTitle("Title")
                .navigationBarTitleDisplayMode(.inline)
            }
            .presentationDragIndicator(.visible)
            .presentationCornerRadius(40)
            .presentationDetents([.medium, .large])
            .presentationBackgroundInteraction(.enabled(upThrough: .large))
            .presentationBackground(.ultraThinMaterial)
//            .presentationBackground {
//                Color.blue
//            }
        } else {
            NavigationStack {
                ScrollView {
                    Rectangle()
                        .fill(.red)
                        .frame(height: 300)
                }
                .navigationTitle("Title")
                .navigationBarTitleDisplayMode(.inline)
            }
            .presentationDragIndicator(.visible)
            .presentationDetents([.medium, .large])
        }
    }
}

struct Item: Identifiable, Hashable {
    var id: UUID = UUID()
    var title: String?
}

#Preview {
    NavigationStack {
        Sheet_Learning()
            .navigationTitle("Title")
            .navigationBarTitleDisplayMode(.inline)
    }
}
