//
//  Shapes+Learning.swift
//  SwiftUILearning
//
//  Created by Shohjahon Rakhmatov on 09/04/25.
//

import SwiftUI

struct Shapes_Learning: View {
    var body: some View {
        VStack {
            UnevenRoundedRectangle(topLeadingRadius: 16, bottomLeadingRadius: 16, bottomTrailingRadius: 0, topTrailingRadius: 0)
                .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round, miterLimit: 4, dash: [4, 16, 4], dashPhase: 12))
            UnevenRoundedRectangle(topLeadingRadius: 16, bottomLeadingRadius: 16, bottomTrailingRadius: 0, topTrailingRadius: 0)
                .fill(Color.red)
            Circle()
                .fill(Color.green)
            Rectangle()
                .fill(Color.red)
                .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 16, bottomLeading: 16, bottomTrailing: 0, topTrailing: 0)))
                .padding()
                .background {
                    UnevenRoundedRectangle(topLeadingRadius: 16, bottomLeadingRadius: 16, bottomTrailingRadius: 0, topTrailingRadius: 0)
                        .stroke(lineWidth: 4)
                }
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.green)
            Capsule()
                .fill(Color.red)
            Ellipse()
                .fill(Color.green)
        }
        .padding()
    }
}

#Preview {
    Shapes_Learning()
}
