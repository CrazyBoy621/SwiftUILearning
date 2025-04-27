//
//  Picker+Learning.swift
//  SwiftUILearning
//
//  Created by Shohjahon Rakhmatov on 23/04/25.
//

import SwiftUI

struct Picker_Learning: View {
    
    @State var selectedName: String = "John"
    @State var selectedDate: Date = Date()
    
    var body: some View {
        ScrollView {
            Picker("Title", selection: $selectedName) {
                Text("John")
                    .tag("John")
                Text("Mary")
                    .tag("Mary")
            }
            .pickerStyle(.wheel)
            DatePicker("Selected Date", selection: $selectedDate, in: Date(timeIntervalSince1970: Date().timeIntervalSince1970 - (24 * 60 * 60))...Date(), displayedComponents: [.date, .hourAndMinute])
                .datePickerStyle(.wheel)
            DatePicker("Selected Date", selection: $selectedDate, displayedComponents: [.date])
//                .datePickerStyle(.wheel)
            
        }
    }
}

#Preview {
    Picker_Learning()
}
