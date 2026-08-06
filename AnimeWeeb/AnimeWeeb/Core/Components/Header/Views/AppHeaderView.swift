//
//  AppHeaderView.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct AppHeaderView: View {
    
    @State private var isMenuOpen = false
    @AppStorage(StorageKeys.isLoggedIn) private var isLoggedIn = false
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    //TODO: User Service
    var user: User?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // MARK: - App Header
            ZStack {
                HStack {
                    // MARK: Home Button
                    Button {
                        print("Go home")
                    } label: {
                        HStack {
                            // MARK: Icon
                            Image(.icon)
                            
                            // MARK: Title
                            Text("AnimeWeeb")
                                .font(.callout.weight(.bold))
                                .foregroundStyle(Color(.mainTitle))
                        }
                    }
                    
                    
                    Spacer()
                    
                    HStack(spacing: 12) {
                        // MARK: Profile Button
                        ProfileButton(avatarURL: user?.avatarUrl)
                        
                        // MARK: Menu Button
                        MenuButton()
                    }
                }
            }
            .padding()
            .background {
                ZStack {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .preferredColorScheme(.dark)
                    Color.background.opacity(0.85)
                }
                .ignoresSafeArea(edges: .top)
            }
            .overlay(alignment: .bottom) {
                Rectangle()
                    .fill(.stroke.opacity(0.8))
                    .frame(height: 1)
            }
            
            // MARK: - Menu Header
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading, spacing: 30) {
                    // MARK: Home Button
                    Button {
                        print("Menu Button pressed")
                    } label: {
                        Label {
                            Text("Каталог")
                                .font(.body)
                                .foregroundStyle(.largeTitle)
                        } icon: {
                            Image(systemName: "line.horizontal.3")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(.menuIconGrey)
                        }
                    }

                    VStack(alignment: .leading, spacing: 20) {
                        Text("Поддержите нас подпиской на соцсети, будем благодарны.")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                        
                        // MARK: Social Media Grid
                        LazyVGrid(columns: columns, spacing: 8) {
                            ForEach(SocialMedia.allCases) { socialMedia in
                                Button {
                                    print(socialMedia.rawValue, "pressed")
                                } label: {
                                    Label(socialMedia.rawValue, image: socialMedia.symbolName)
                                        .font(.system(.body, weight: .medium))
                                        .foregroundStyle(.subtitle)
                                        .frame(maxWidth: .infinity)
                                        .padding(.horizontal)
                                        .padding(.vertical, 12)
                                        .animeCardBackgroundModifier()
                                }

                                
                            }
                        }
                        
                        if !isLoggedIn {
                            //MARK: User Profile Card
                            if let user = user {
                                HStack() {
                                    ProfileButton(avatarURL: user.avatarUrl)
                                    
                                    VStack(alignment: .leading) {
                                        Text(user.name)
                                            .font(.system(.body, weight: .semibold))
                                        
                                        Text("Уровень \(user.level) • Профиль")
                                            .font(.footnote)
                                            .foregroundStyle(.gray)
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(.profileButtonBackground))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .strokeBorder(.stroke, lineWidth: 1))
                            }
                        } else {
                            //MARK: LogIn Button
                            Button {
                                print("LogIn Button pressed")
                            } label: {
                                Text("Войти")
                                    .font(.system(.title2, weight: .semibold))
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(.purpleBackground)
                                    )
                            }
                        }
                    }
                }

            }
            .padding()
            .overlay(alignment: .bottom) {
                Rectangle()
                    .fill(.stroke.opacity(0.8))
                    .frame(height: 1)
            }
        }
        
    }
}

#Preview {
    VStack {
        AppHeaderView(user: previewUser)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.background)
}




