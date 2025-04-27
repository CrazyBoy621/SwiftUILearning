//
//  Stepper+Learning.swift
//  SwiftUILearning
//
//  Created by Shohjahon Rakhmatov on 23/04/25.
//

import SwiftUI

struct Stepper_Learning: View {
    
    @State private var value: Int = 0
    @State private var newValue: Float = 0
    
    init() {
//        UIScrollView.appearance().bounces = false
        UISlider.appearance().thumbTintColor = UIColor.red
    }
    
    var body: some View {
        ScrollView {
            Stepper("Title \(value.description)", value: $value, in: 0...5)
            Stepper(value: $value, step: 2) {
                Text(value.description)
            }
            Slider(value: $newValue, in: 0...10)
                .tint(Color.red)
            ScrollView {
                Text("Test")
            }
            .frame(height: 400)
            .border(.red)
        }
    }
}

#Preview {
    Stepper_Learning()
}
