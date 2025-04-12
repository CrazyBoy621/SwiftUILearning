//
//  State+Learning.swift
//  SwiftUILearning
//
//  Created by Shohjahon Rakhmatov on 11/04/25.
//

import SwiftUI

// let, var
// State

struct State_Learning: View {
    
    @State var count: Int = 0
    @State var background: Color = .blue
    
    var body: some View {
        VStack {
            InitializerView(raqam: 10)
            InitializerView(count: 9)
            CountView(raqam: count) {
                count -= 1
            }
            CountView(count: count) {
                count -= 1
            }
            if count == 0 {
                Text("No items")
            } else {
                Text("Item \(count)")
            }
            Text(count.description)
            Button("Increase") {
                count += 1
            }
            Button("Change background") {
                background = .red
            }
//            .foregroundStyle(.primary)
        }
        .tint(Color.white)
        .background(background)
    }
}

struct InitializerView: View {
    
    var count: Int = 0
    
    init(raqam: Int = 10) {
        count = raqam
    }
    
    init(count: Int) {
        self.count = count
    }
    
    var body: some View {
        Text(count.description)
    }
}

struct CountView: View {
    
    var count: Int
    var action: () -> Void
    
    init(count: Int, action: @escaping () -> Void) {
        self.count = count
        self.action = action
    }
    
    init(raqam: Int, nimadir: @escaping () -> Void) {
        count = raqam
        action = nimadir
    }
    
    var body: some View {
        VStack {
            Text("\(count)")
                .border(.red)
            Button("Decrease") {
                action()
//                count -= 1
            }
        }
    }
}

#Preview {
    State_Learning()
}
