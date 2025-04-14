//
//  CustomSheet.swift
//  SwiftUILearning
//
//  Created by Shohjahon Rakhmatov on 14/04/25.
//

import SwiftUI

struct CustomSheet<Content: View>: View {
    
    @Binding var isPresented: Bool
    var content: Content
    
    init(isPresented: Binding<Bool>, @ViewBuilder content: () -> Content) {
        _isPresented = isPresented
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if isPresented {
                Color.black.opacity(0.3)
                    .transition(.opacity)
                    .onTapGesture {
                        isPresented = false
                    }
                    .ignoresSafeArea()
                content
                    .frame(maxWidth: .infinity)
                    .frame(minHeight: 400, alignment: .top)
                    .background {
                        UnevenRoundedRectangle(topLeadingRadius: 20, topTrailingRadius: 20)
                            .fill(.background)
                            .ignoresSafeArea(edges: .bottom)
                    }
                    .ignoresSafeArea(edges: .bottom)
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom).combined(with: .opacity)))
            }
        }
        .animation(.bouncy, value: isPresented)
    }
}

struct TestSheetView: View {
    
    @State private var showSheet = false
    
    var body: some View {
        Button("Show content") {
            showSheet = true
        }
//        .sheet(isPresented: $showSheet, content: {
//            Text("Hello")
//                .presentationDetents([.height(400)])
//        })
        .customSheet(isPresented: $showSheet) {
            Text("Hello")
        }
    }
}

#Preview {
    TestSheetView()
}

extension View {
    
    func customSheet<Content: View>(isPresented: Binding<Bool>, @ViewBuilder content: () -> Content) -> some View {
        frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(CustomSheet(isPresented: isPresented, content: content), alignment: .bottom)
    }
    
}
