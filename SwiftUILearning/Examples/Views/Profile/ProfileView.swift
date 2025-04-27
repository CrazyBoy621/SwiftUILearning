//
//  ProfileView.swift
//  SwiftUILearning
//
//  Created by Shohjahon Rakhmatov on 26/04/25.
//

import SwiftUI

struct ProfileView: View {
    
    @State var appearance: ColorScheme = .light
    @Environment(\.colorScheme) var colorSchema
    
    var body: some View {
        NavigationStack {
            List {
                UserProfileView()
                CustomSection("Main") {
                    Toggle(isOn: .constant(false)) {
                        HStack {
                            Image(.bellIcon)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            Text("Notification")
                        }
                    }
                    Button {
                        
                    } label: {
                        ProfileCellView("Login as Specialist", image: .personIcon)
                        .foregroundStyle(Color.primary)
                    }
                    Button("Toggle Appearance") {
                        appearance = appearance == .light ? .dark : .light
                    }
                }
                CustomSection("Additional") {
                    Button {
                        
                    } label: {
                        ProfileCellView("Language", image: .globeIcon, type: .navigation) {
                            Text("O'zbekcha")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundStyle(Color.accentColor)
                        }
                        .foregroundStyle(Color.primary)
                    }
                    Button {
                        
                    } label: {
                        ProfileCellView("Share", image: .circularShareIcon)
                            .foregroundStyle(Color.primary)
                    }
                    Button {
                        
                    } label: {
                        ProfileCellView("Privacy Policy", image: .checkShieldIcon)
                            .foregroundStyle(Color.primary)
                    }
                    Button {
                        
                    } label: {
                        ProfileCellView("Terms of Service", image: .shareIcon)
                            .foregroundStyle(Color.primary)
                    }
                    Button {
                        
                    } label: {
                        ProfileCellView("Terms of Use", image: .shareIcon)
                            .foregroundStyle(Color.primary)
                    }
                    Button(role: .destructive, action: logout) {
                        ProfileCellView("Sign out", image: .signOutIcon)
                    }
                }
            }
            .onAppear(perform: didAppear)
            .toolbarBackground(.visible, for: .navigationBar)
            .overlay(alignment: .top, content: NavigationShadowView)
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: ToolbarContent)
        }
        .environment(\.colorScheme, appearance)
    }
    
    @ViewBuilder func NavigationShadowView() -> some View {
        Rectangle()
            .fill(.ultraThinMaterial)
            .opacity(0.5)
            .frame(height: 44)
            .shadow(color: Color.black.opacity(0.4), radius: 8, x: 0, y: 4)
            .offset(y: -44)
    }
    
    @ViewBuilder func ProfileCellView<Content: View>(_ title: LocalizedStringKey, systemImage: String? = nil, image: ImageResource? = nil, type: ButtonType = .button, @ViewBuilder content: () -> Content = { EmptyView() }) -> some View {
        HStack {
            Group {
                if let systemImage {
                    Image(systemName: systemImage)
                } else if let image {
                    Image(image)
                        .resizable()
                }
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 24, height: 24)
            Text(title)
            Spacer(minLength: 0)
            content()
            if type == .navigation {
                Image(systemName: "chevron.right")
                    .font(.system(size: 13, weight: .bold))
                    .foregroundStyle(Color.secondary.opacity(0.5))
            }
        }
    }
    
    @ViewBuilder func MainProfileSectionView() -> some View {
        Section {
            Toggle(isOn: .constant(false)) {
                HStack {
                    Image(.bellIcon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                    Text("Notification")
                }
            }
            Button {
                
            } label: {
                HStack {
                    Image(.personIcon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                    Text("Login as Specialist")
                }
                .foregroundStyle(Color.primary)
            }
        } header: {
            Text("Main")
                .font(.system(size: 18, weight: .medium))
                .textCase(.none)
                .padding(.horizontal, -16)
        }
    }
    
    @ViewBuilder func UserProfileView() -> some View {
        NavigationLink {
            Text("Test")
                .navigationTitle("Test")
                .navigationBarTitleDisplayMode(.inline)
        } label: {
            HStack(spacing: 8) {
                Circle()
                    .frame(width: 72, height: 72)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Shohjahon Rahmatov")
                        .font(.system(size: 17, weight: .medium))
                    Text("Customer")
                        .foregroundStyle(Color.secondary)
                        .font(.system(size: 14))
                }
            }
        }
    }
    
    @ViewBuilder func CustomSection<Content: View>(_ header: LocalizedStringKey? = nil, @ViewBuilder content: () -> Content) -> some View {
        Section {
            content()
        } header: {
            if let header {
                Text(header)
                    .font(.system(size: 18, weight: .medium))
                    .textCase(.none)
                    .padding(.horizontal, -16)
            }
        }
    }
    
    @ViewBuilder func MyHStack<Content: View>(@ViewBuilder content: () -> Content) -> some View {
        HStack(alignment: .top, spacing: 0) {
            content()
        }
    }
    
    @ToolbarContentBuilder func ToolbarContent() -> some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Text("")
        }
        ToolbarItem(placement: .topBarLeading) {
            Text("Profile")
                .font(.system(size: 24, weight: .semibold))
        }
    }
    
    func didAppear() {
        appearance = colorSchema
    }
    
    enum ButtonType {
        case button
        case navigation
    }
}

#Preview {
    ProfileView()
}

extension ProfileView {
    
    func logout() {
        
    }
    
}
