//
//  AppHeaderView.swift
//  AnimeWeeb
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
        .background(Color.background.opacity(0.85))
        .overlay(alignment: .bottom) {
            Rectangle()
                .fill(.stroke.opacity(80))
                .frame(height: 1)
        }
    }
}

#Preview {
    AppHeaderView()
}




