//
//  Frame+Learning.swift
//  SwiftUILearning
//
//  Created by Shohjahon Rakhmatov on 07/04/25.
//

import SwiftUI

struct Frame_Learning: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                TitleView(title: "Hello")
                TitleView(title: "Hello")
                Text("Test")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Rectangle()
                    .frame(height: 200)
                    .frame(maxHeight: .infinity)
                    .frame(maxHeight: .infinity, alignment: .top)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Test") { }
                }
            }
            .background(alignment: .bottom, content: myView)
            .navigationTitle("Title")
            .navigationBarTitleDisplayMode(.inline)
        }
//        .overlay(Color.black.opacity(0.5))
    }
}

extension Frame_Learning {
    
    @ViewBuilder func MyButton(_ title: LocalizedStringKey, action: @escaping () -> ()) -> some View {
        Button(title, action: action)
            .buttonStyle(.borderedProminent)
            .tint(Color.green)
    }
    
    @ViewBuilder func TitleView(title: LocalizedStringKey) -> some View {
        Text(title)
    }
    
    var titleView: some View {
        Text("title")
    }
    
    func myView() -> some View {
        Button("Test") {
            print("tested")
        }
    }
}

struct TitleView: View {
    
    var title: LocalizedStringKey
    
    var body: some View {
        Text(title)
    }
}

// MARK: - Notes
// static raqam iloji boricha bermaslik kerak
// padding ishlashi haqida yaxshilab tushib olishimiz kerak


#Preview {
    Frame_Learning()
}


//struct Frame_Learning: View {
//    var body: some View {
//        NavigationStack {
//            VStack {
//                Rectangle()
//                    .frame(width: 200, height: 100)
//                    .padding()
//                VStack {
//                    Text("Test alsdfj adskhfa lksdjf aksjdfh lakjdh fklajsdh flka dfa dfklj aldkfjh akljdhf alkjsdhf lkajhdf lkajdh fklajh df")
//                }
//                .padding()
//                .frame(width: 200, height: 100)
//                .border(.red)
//                HStack(alignment: .bottom) {
//                    VStack {
//                        Text("Hello")
//                    }
//                    .frame(maxWidth: .infinity)
//                    .border(.red)
//                    VStack {
//                        Text("Hello")
//                    }
//                    .frame(maxWidth: .infinity)
//                    .border(.red)
//                    VStack {
//                        VStack(alignment: .leading) {
//                            Text("Hello")
//                        }
//                        .frame(width: 100, alignment: .leading)
//                    }
//                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
//                    .border(.red)
//                }
//            }
//        }
//    }
//}
