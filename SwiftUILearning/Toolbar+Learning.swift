//
//  Toolbar+Learning.swift
//  SwiftUILearning
//
//  Created by Shohjahon Rakhmatov on 18/04/25.
//

import SwiftUI

struct Toolbar_Learning: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                NavigationLink("User details") {
                    Text("This is user details page")
                }
                TextField("TextField", text: .constant(""))
                Text("Test again")
            }
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.background, for: .navigationBar)
            .toolbarBackground(.visible, for: .bottomBar)
            .toolbarBackground(.background, for: .bottomBar)
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    HStack {
                        Button("", systemImage: "chevron.down") {
                            
                        }
                        Button("", systemImage: "chevron.up") {
                            
                        }
                        Button("Done") {
                            
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        
                    } label: {
                        Text("Confirm")
                            .frame(maxWidth: .infinity)
                            .padding(4)
                    }
                    .buttonStyle(.borderedProminent)
                }
                ToolbarItem(placement: .principal) {
                    Text("Settings")
                        .font(.largeTitle)
                }
//                ToolbarItem {
//                    HStack {
//                        Button("", systemImage: "gearshape") {
//                            
//                        }
//                        Button("", systemImage: "info.circle") {
//                            
//                        }
//                    }
//                }
            }
        }
    }
}

struct ToolbarContentBuilderView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                NavigationLink("User details") {
                    Text("This is user details page")
                }
                TextField("TextField", text: .constant(""))
                Text("Test again")
            }
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.background, for: .navigationBar)
            .toolbarBackground(.visible, for: .bottomBar)
            .toolbarBackground(.background, for: .bottomBar)
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: ToolbarContent)
        }
    }
    
    @ToolbarContentBuilder func ToolbarContent() -> some ToolbarContent {
        ToolbarItem(placement: .keyboard) {
            HStack {
                Button("", systemImage: "chevron.down") {
                    
                }
                Button("", systemImage: "chevron.up") {
                    
                }
                Button("Done") {
                    
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        ToolbarItem(placement: .bottomBar) {
            Button {
                
            } label: {
                Text("Confirm")
                    .frame(maxWidth: .infinity)
                    .padding(4)
            }
            .buttonStyle(.borderedProminent)
        }
        ToolbarItem(placement: .principal) {
            Text("Settings")
                .font(.largeTitle)
        }
        //                ToolbarItem {
        //                    HStack {
        //                        Button("", systemImage: "gearshape") {
        //
        //                        }
        //                        Button("", systemImage: "info.circle") {
        //
        //                        }
        //                    }
        //                }
    }
}

struct TabbarWithToolbarView: View {
    var body: some View {
        TabView {
            NavigationStack {
                ScrollView {
                    Text("Home")
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(.background, for: .tabBar)
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            ScrollView {
                Text("Settings")
            }
            .tabItem {
                Label("Settings", systemImage: "gearshape")
            }
        }
    }
}


#Preview {
    TabbarWithToolbarView()
}


#Preview {
    Toolbar_Learning()
}
