//
//  Animation+Learning.swift
//  SwiftUILearning
//
//  Created by Shohjahon Rakhmatov on 11/04/25.
//

import SwiftUI

struct Animation_Learning: View {
    
    @State private var isShowing: Bool = false
//    @State private var show: Bool = false
    var show: Bool = false
    @State private var count: Int = 0
    
    var body: some View {
        VStack {
            Group {
                if count == 0 {
                    Rectangle()
                        .fill(Color.red)
                        .animation(.easeInOut, value: isShowing)
                } else {
                    Rectangle()
                        .fill(Color.blue)
                }
            }
            .frame(width: 200, height: 200)
//            Rectangle()
//                .fill(isShowing ? Color.red : Color.blue)
//                .frame(width: 200, height: 200)
            Button("Update Color") {
                isShowing.toggle()
                withAnimation(.bouncy) {
                    count = 1
                }
            }
        }
        .animation(.easeInOut, value: count)
//        .animation(.easeInOut, value: isShowing)
    }
}

#Preview {
    Animation_Learning()
}
