//
//  Color+Learning.swift
//  SwiftUILearning
//
//  Created by Shohjahon Rakhmatov on 07/04/25.
//

import SwiftUI

struct Color_Learning: View {
    
    init() {
        print("initialized")
    }
    
    var body: some View {
        TabView {
            ScrollView {
                VStack {
                    Rectangle()
                        .fill(.background)
                        .border(Color.blue)
                    Rectangle()
                        .fill(.foreground)
                    // system material
                    Rectangle()
                        .fill(.bar)
                }
                .frame(height: 600)
                // faqat ios 18+ support qiladi bazi imagelar
                Image(systemName: "clock.arrow.trianglehead.2.counterclockwise.rotate.90")
                // Multicolor
                    .foregroundStyle(Color.white, Color.red)
                    .font(.largeTitle)
                    .frame(height: 800)
            }
            // Colorni UIColorga convert qilish
            .toolbarBackground(Color(UIColor.systemGray6), for: .tabBar)
            .tabItem {
                Label("Home", systemImage: "house")
            }
        }
        .onAppear {
            print("appeared")
        }
        .onDisappear {
            print("disappeared")
        }
    }
}

#Preview {
    Color_Learning()
}

extension Color {
    
    init(hex: String) {
        let scanner = Scanner(string: hex.replacingOccurrences(of: "#", with: "").trimmingCharacters(in: .whitespacesAndNewlines))
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: Double(red), green: Double(green), blue: Double(blue))
    }
    
    static var newBackground = Color(hex: "333333")
    
}
