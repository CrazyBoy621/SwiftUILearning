//
//  Spacer+Learning.swift
//  SwiftUILearning
//
//  Created by Shohjahon Rakhmatov on 11/04/25.
//

import SwiftUI

struct Spacer_Learning: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                HStack {
                    Text("Chap  asduhf asdfhalidf as df aklsdhjf alksdfh akjldf ")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .border(.red)
//                    Spacer(minLength: 0)
//                        .frame(height: 10)
//                        .border(.red)
//                    Spacer(minLength: 0)
//                        .frame(height: 10)
//                        .border(.green)
                    Text("O'ng")
                        .border(.red)
                }
                VStack {
                    Spacer()
                        .frame(maxWidth: .infinity)
                        .frame(height: 800)
//                        .background(Color.red)
                    Text("Hello, World!")
                }
                .frame(minHeight: geometry.size.height)
            }
        }
    }
}

#Preview {
    Spacer_Learning()
}
