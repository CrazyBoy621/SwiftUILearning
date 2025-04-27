//
//  NavigationStack+Learning.swift
//  SwiftUILearning
//
//  Created by Shohjahon Rakhmatov on 16/04/25.
//

import SwiftUI

struct NavigationStack_Learning: View {
    
    @State private var selection: Item?
    @State private var isPresented: Bool = false
    
    init() {
        print("Initialized NavigationStack_Learning")
    }
    
    var body: some View {
        NavigationStack {
            if #available(iOS 17.0, *) {
                ScrollView {
                    //                NavigationLink("Go to another view") {
                    //                    NavigationTestView()
                    //                }
                    Button("Go to another view") {
//                        isPresented = true
                        selection = Item(title: "Hello")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            self.selection = nil
                        }
                    }
                }
                .onChange(of: selection) { oldValue, newValue in
                    print(newValue ?? "nil")
                }
                .navigationDestination(item: $selection) { item in
                    NavigationTestView(selection: item)
                }
//                .navigationDestination(isPresented: $isPresented) {
//                    NavigationTestView()
//                }
                .navigationTitle("Settings view title")
                .navigationBarTitleDisplayMode(.inline)
            } else {
                ScrollView {
                    //                NavigationLink("Go to another view") {
                    //                    NavigationTestView()
                    //                }
                    Button("Go to another view") {
                        isPresented = true
                    }
                }
            }
        }
    }
}

struct NavigationTestView: View {
    
//    init() {
//        print("Initialized NavigationTestView")
//    }
    
    var selection: Item
    
    var body: some View {
        ScrollView {
            Text("NavigationTestView")
        }
//        .navigationTitle("Settings view title")
        .navigationTitle(selection.title ?? "Settings")
    }
}

struct NavigationPath_Learning: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                Button("Go to another view") {
                    path.append(Item(title: "Another view"))
                }
                Button("Go to Test") {
                    path.append(String("Test"))
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
//            .navigationDestination(for: NewItem.self) { item in
//                NavigationTestView(selection: Item(title: item.title))
//            }
            .navigationDestination(for: String.self) { value in
                PostsView(path: $path)
            }
            .navigationDestination(for: Item.self) { item in
                NavigationTestView(selection: item)
            }
        }
    }
}

struct PostsView: View {
    
    @Binding var path: NavigationPath
    
    var body: some View {
        ScrollView {
            Button("Go another view") {
                path.append(NewItem(title: "Title"))
                path.append(NewItem(title: "Second Title"))
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    path.append(NewItem(title: "Third Title"))
                }
            }
        }
        .navigationDestination(for: NewItem.self) { item in
            NavigationTestView(selection: Item(title: item.title))
        }
    }
}

struct NewItem: Hashable {
    
    var title: String
    
}

struct SettingsView: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                VStack {
                    SettingsCell("User", systemName: "chevron.right") {
                        path.append(SettingsNavigation.profile(User(name: "Learning")))
                    }
                    Divider()
                    SettingsCell("Theme", systemName: "chevron.right") {
                        path.append(SettingsNavigation.theme)
                    }
                }
                .tint(Color.primary)
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(.bar)
                .clipShape(.rect(cornerRadius: 16))
                .padding()
            }
            .navigationDestination(for: SettingsNavigation.self, destination: NavigationView)
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    @ViewBuilder func SettingsCell(_ title: String, systemName: String? = nil, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Text(title)
                Spacer(minLength: 0)
                if let systemName {
                    Image(systemName: systemName)
                }
            }
            .padding(.vertical, 4)
        }
    }
    
    @ViewBuilder func NavigationView(_ navigation: SettingsNavigation) -> some View {
        switch navigation {
        case .profile(let user):
            ProfileView2(user: user, path: $path)
        case .theme:
            Text("Theme")
        }
    }
}

enum SettingsNavigation: Hashable {
    case profile(User)
    case theme
}

struct User: Identifiable, Hashable {
    var id: Int = Int.random(in: 0..<1000)
    var name: String
}

struct ProfileView2: View {
    
    var user: User
    @Binding var path: NavigationPath
    
    var body: some View {
        ScrollView {
            Button("Theme", systemImage: "chevron.right") {
                path.append(SettingsNavigation.theme)
            }
        }
        .toolbarRole(.editor)
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SettingsView()
}

#Preview {
    NavigationPath_Learning()
}
