//
//  ListExample+Learning.swift
//  SwiftUILearning
//
//  Created by Shohjahon Rakhmatov on 21/04/25.
//

import SwiftUI

struct ListExample_Learning: View {
    
    @State private var name: String = ""
    @State private var lastName: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                ProfileImageView()
                ProfileNameView()
                ProfileLastNameView()
                ProfilePhoneNumberView()
                SaveProfileView()
            }
            .toolbar(content: ToolbarContent)
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarRole(.editor)
//            .toolbarBackground(.visible, for: .navigationBar)
//            .toolbarBackground(.background, for: .navigationBar)
//            .safeAreaInset(edge: .bottom, spacing: 0, content: BottomButtonView)
        }
    }
    
    @ToolbarContentBuilder func ToolbarContent() -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Menu("", systemImage: "ellipsis.circle") {
                Button("Delete", systemImage: "trash", role: .destructive) {
                    
                }
            }
        }
    }
    
    @ViewBuilder func SaveProfileView() -> some View {
        Section {
            Button("Save") {
                
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    @ViewBuilder func DeleteProfileView() -> some View {
        Section {
            Button("Delete profile", role: .destructive) {
                
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    @ViewBuilder func ProfilePhoneNumberView() -> some View {
        Section {
            HStack(spacing: 12) {
                Text("+998")
                Divider()
                Text("90-123-45-67")
                    .foregroundStyle(Color.secondary)
            }
            .listRowInsets(.init(top: 0, leading: 12, bottom: 0, trailing: 12))
        } header: {
            HStack {
                Text("Phone Number")
                Spacer(minLength: 0)
                Button("Change Phone") {
                    
                }
                .foregroundStyle(Color.blue)
            }
            .font(.system(size: 16, weight: .medium))
            .foregroundStyle(.primary)
            .textCase(.none)
        }
        .apply {
            if #available(iOS 17, *) {
                $0.listSectionSpacing(48)
            } else {
                $0
            }
        }
    }
    
    @ViewBuilder func ProfileLastNameView() -> some View {
        Section {
            TextField("Last Name", text: $lastName)
        } header: {
            Text("Your last name (Optional)")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.primary)
                .textCase(.none)
        }
        .apply {
            if #available(iOS 17, *) {
                $0.listSectionSpacing(0)
            } else {
                $0
            }
        }
    }
    
    @ViewBuilder func ProfileNameView() -> some View {
        Section {
            TextField("Name", text: $name)
        } header: {
            Text("Your name")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.primary)
                .textCase(.none)
        }
        .apply {
            if #available(iOS 17, *) {
                $0.listSectionSpacing(0)
            } else {
                $0
            }
        }
    }
    
    @ViewBuilder func ProfileImageView() -> some View {
        Section {
            Button {
                
            } label: {
                ZStack {
                    Image(systemName: "camera")
                        .font(.system(size: 32))
                }
                .frame(width: 100, height: 100)
                .background(Color.white)
                .clipShape(.circle)
            }
            .buttonStyle(.plain)
            .overlay(alignment: .bottomTrailing ) {
                Button {
                    
                } label: {
                    Image(systemName: "pencil.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 28, height: 28)
                        .foregroundStyle(Color.accentColor)
                }
                .buttonStyle(.plain)
            }
            .frame(maxWidth: .infinity)
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
        .listRowBackground(EmptyView())
    }
    
    @ViewBuilder func BottomButtonView() -> some View {
        Button {
            
        } label: {
            Text("Save")
                .frame(maxWidth: .infinity)
                .padding(.vertical, 6)
                .fontWeight(.semibold)
        }
        .buttonStyle(.borderedProminent)
        .padding(.horizontal)
        .padding(.vertical, 8)
        .disabled(true)
    }
}

#Preview {
    ListExample_Learning()
}

extension View {
    
    func apply<V: View>(@ViewBuilder _ block: (Self) -> V) -> V { block(self) }
    
}
