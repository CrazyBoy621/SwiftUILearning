//
//  Animations.swift
//  SwiftUILearning
//
//  Created by Shohjahon Rakhmatov on 14/04/25.
//

import SwiftUI

struct Animations: View {
    
    @State private var scale: CGFloat = 1
    @State private var showPopup: Bool = false
    
    var body: some View {
        VStack {
            Button("Show popup") {
                showPopup = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    self.showPopup = false
                }
            }
            Circle()
                .frame(width: 40 * scale)
                .animation(Animation.bouncy, value: scale)
        }
        .border(.green)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay {
            if showPopup {
                Text("Copied")
                    .padding(10)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.bar)
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.secondary)
                    }
//                    .transition(.scale(scale: 0.8).combined(with: .move(edge: .bottom)).combined(with: .opacity))
//                    .transition(.scale(scale: 0.8).combined(with: .asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top))).combined(with: .opacity))
//                    .transition(.modifier(active: PopupTransitionModifier(isIdentity: false), identity: PopupTransitionModifier(isIdentity: true)))
//                    .transition(.asymmetric(insertion: .modifier(active: PopupTransitionModifier(isIdentity: false), identity: PopupTransitionModifier(isIdentity: true)), removal: .modifier(active: PopupTransitionModifier(isIdentity: false, isInsertion: false), identity: PopupTransitionModifier(isIdentity: true, isInsertion: false))))
            }
        }
        .animation(.bouncy, value: showPopup)
    }
}

/// custom our transition
struct PopupTransitionModifier: ViewModifier {
    
    let isIdentity: Bool
    var isInsertion: Bool = true
    
    func body(content: Content) -> some View {
        content
            .opacity(isIdentity ? 1 : 0)
            .blur(radius: isIdentity ? 0 : 10)
            .scaleEffect(isIdentity ? 1 : 0.8)
            .offset(y: isIdentity ? 0 : isInsertion ? -100 : 100)
    }
    
}

#Preview {
    Animations()
}
