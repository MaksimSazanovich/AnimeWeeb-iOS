//
//  AppHeaderView.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct AppHeaderView: View {
    
    @State var viewModel: AppHeaderViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
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
                        ProfileButton(avatarURL: viewModel.user?.avatarUrl)
                        
                        // MARK: Menu Button
                        MenuButton() {
                            withAnimation(.easeOut(duration: 0.28)) {
                                viewModel.onMenuButtonTapped()
                            }
                        }
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
            .zIndex(1)
            
            if viewModel.isMenuOpen {
                // MARK: - Menu Header
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
                        Grid(horizontalSpacing: 8, verticalSpacing: 8) {
                            GridRow {
                                SocialButton(for: .tikTok) { socialMedia in
                                    viewModel.didTapSocial(socialMedia: socialMedia)
                                }
                                
                                SocialButton(for: .instagram) { socialMedia in
                                    viewModel.didTapSocial(socialMedia: socialMedia)
                                }
                            }
                            
                            GridRow {
                                SocialButton(for: .patreon) { socialMedia in
                                    viewModel.didTapSocial(socialMedia: socialMedia)
                                }
                                
                                SocialButton(for: .telegram) { socialMedia in
                                    viewModel.didTapSocial(socialMedia: socialMedia)
                                }
                            }
                        }
                        
                        if viewModel.isLoggedIn {
                            //MARK: User Profile Card
                            if let user = viewModel.user {
                                Button {
                                    print("Profile Button pressed")
                                } label: {
                                    HStack() {
                                        ProfileButton(avatarURL: user.avatarUrl)
                                        
                                        VStack(alignment: .leading) {
                                            Text(user.name)
                                                .font(.system(.body, weight: .semibold))
                                                .foregroundStyle(.white)
                                            
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
                .padding(.horizontal)
                .padding(.vertical, 25)
                .overlay(alignment: .bottom) {
                    Rectangle()
                        .fill(.stroke.opacity(0.8))
                        .frame(height: 1)
                }
                .background(Color.background)
                .drawingGroup()
                .transition(
                    .move(edge: .top)
                    .combined(with: .opacity)
                )
                .zIndex(0)
            }
        }
    }
}

#Preview {
    
    let appURLOpener = AppURLOpener()
    VStack {
        AppHeaderView(viewModel: AppHeaderViewModel(urlOpener: appURLOpener, isLoggedIn: false, user: previewUser))
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.background)
}





