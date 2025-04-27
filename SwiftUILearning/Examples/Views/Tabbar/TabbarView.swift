//
//  TabbarView.swift
//  SwiftUILearning
//
//  Created by Shohjahon Rakhmatov on 26/04/25.
//

import SwiftUI

struct TabbarView: View {
    
    @State private var selection: ContentTabs = .home
    
    var body: some View {
        TabView {
            ForEach(ContentTabs.allCases, id: \.self) { tab in
                tab.content
                    .tabItem {
                        Image(tab.image)
                    }
            }
        }
    }
}

enum ContentTabs: CaseIterable {
    
    case home
    case search
    case orders
    case favourites
    case profile
    
    var title: LocalizedStringKey {
        switch self {
        case .home:
            return "Home"
        case .search:
            return "Search"
        case .orders:
            return  "Orders"
        case .favourites:
            return "Favourites"
        case .profile:
            return "Profile"
        }
    }
    
    var image: ImageResource {
        switch self {
        case .home:
            return .homeTabIcon
        case .search:
            return .searchTabIcon
        case .orders:
            return .bagTabIcon
        case .favourites:
            return .heartTabIcon
        case .profile:
            return .profileTabIcon
        }
    }
    
    var content: some View {
        switch self {
        case .profile:
            return Text("Test")
        default:
            return Text(self.title)
        }
    }
    
}

#Preview {
    TabbarView()
}
