//
//  List+Learning.swift
//  SwiftUILearning
//
//  Created by Shohjahon Rakhmatov on 21/04/25.
//

import SwiftUI

struct List_Learning: View {
    
    @State private var names: [String] = ["John", "Nimadir", "Bilmadim"]
    @State private var editMode: EditMode = .inactive
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(0..<20, id: \.self) { name in
                        Text(name.description)
                            .swipeActions(edge: .trailing) {
                                Button("", systemImage: "trash", role: .destructive) {
                                    
                                }
                                Button("Info", systemImage: "info.circle") {
                                    
                                }
                                .tint(Color.green)
                            }
                    }
                    .onDelete(perform: deleteItem)
                    .onMove { _, _ in
                        
                    }
                }
                .environment(\.editMode, $editMode)
            }
            .navigationTitle("Names")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
        }
    }
    
    func deleteItem(_ index: IndexSet) {
        names.remove(atOffsets: index)
    }
    
    func moveItem(_ index: IndexSet, to destination: Int) {
        names.move(fromOffsets: index, toOffset: destination)
    }
    
    var body2: some View {
        List {
            if #available(iOS 17.0, *) {
                Section {
                    Text("Hello World")
                    //                    .border(.red)
                        .listRowInsets(.init(top: 20, leading: 20, bottom: 0, trailing: 0))
                    //                    .listRowSeparator(.hidden)
                    //                    .listRowBackground(Color.clear)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .overlay(alignment: .trailing) {
                            Text("This is overlay")
                                .offset(y: 10)
                        }
                    Text("Hello World")
                } header: {
                    Text("Title")
                    // asl holidagidek qilsak bo'ladi
                    //                    .textCase(.none)
                } footer: {
                    Text("Nimadir yozishimiz mumkin")
                }
                .listSectionSpacing(0)
            } else {
                Section {
                    Text("Hello World")
                    //                    .border(.red)
                        .listRowInsets(.init(top: 20, leading: 20, bottom: 0, trailing: 0))
                    //                    .listRowSeparator(.hidden)
                    //                    .listRowBackground(Color.clear)
                    Text("Hello World")
                } header: {
                    Text("Title")
                    // asl holidagidek qilsak bo'ladi
                    //                    .textCase(.none)
                } footer: {
                    Text("Nimadir yozishimiz mumkin")
                }
            }
            Section {
                Text("Second section")
            }
            Section {
                Button("Nimadir") {
                    
                }
                .foregroundStyle(Color.blue)
                .buttonStyle(.plain)
                .frame(maxWidth: .infinity)
            }
        }
// list background modify qilayotganimizda kerak bo'ladi
//        .scrollContentBackground(.hidden)
//        .background(Color.red)
    }
}

struct ReorderableListView: View {
    @State private var items = ["🍎 Apple", "🍌 Banana", "🍒 Cherry", "🍇 Grape"]

    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.self) { item in
                    Text(item)
                }
                .onMove(perform: moveItem)
            }
            .navigationTitle("Fruits")
            .toolbar {
                EditButton() // Enables editing mode to allow dragging
            }
        }
    }

    // Function to handle the move logic
    func moveItem(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    ReorderableListView()
}

#Preview {
    List_Learning()
}
