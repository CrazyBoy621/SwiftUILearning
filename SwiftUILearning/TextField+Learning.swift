//
//  TextField+Learning.swift
//  SwiftUILearning
//
//  Created by Shohjahon Rakhmatov on 18/04/25.
//

import SwiftUI

struct TextField_Learning: View {
    
    @State private var text = ""
    
    var body: some View {
        ScrollView {
            TextField("Placeholder", text: $text)
                .onChange(of: text, perform: updateText)
            TextField(text: $text) {
                Text("Placeholder")
                    .foregroundStyle(.red)
            }
            .padding(8)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.bar)
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.secondary)
                    .padding(0.5)
            }
            TextField("Placeholder", text: $text, axis: .vertical)
                .lineLimit(3...6)
                .textFieldStyle(.roundedBorder)
        }
    }
    
    func updateText(_ newValue: String) {
        text = newValue.filter({ $0.isNumber })
    }
}

#Preview {
    TextField_Learning()
}
