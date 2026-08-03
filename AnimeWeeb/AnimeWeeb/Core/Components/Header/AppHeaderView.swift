//
//  AppHeaderView.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct AppHeaderView: View {
    var body: some View {
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
                            .foregroundStyle(Color(.mainTitile))
                    }
                }
                
                
                Spacer()
                
                HStack(spacing: 12) {
                    // MARK: Profile Button
                    ProfileButton()
                    
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
    }
}

#Preview {
    VStack {
        AppHeaderView()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.background)
}




