//
//  Toggle+Learning.swift
//  SwiftUILearning
//
//  Created by Shohjahon Rakhmatov on 23/04/25.
//

import SwiftUI

struct Toggle_Learning: View {
    
    @State private var isOn = false
    
    var body: some View {
        ScrollView {
            Toggle("Title", isOn: $isOn)
            // yashil rangni o'zgartirish uchun
                .tint(Color.red)
                .disabled(true)
                .padding()
        }
        List {
            Section {
                Toggle("Title", isOn: $isOn)
                    .tint(Color.red)
            }
            Section {
                Toggle("Dark Mode", systemImage: "moon.fill", isOn: $isOn)
            }
        }
    }
}

#Preview {
    Toggle_Learning()
}
