//
//  ProfileButton.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI
import NukeUI

struct ProfileButton: View {
    
    var profileImageURL: URL?
    
    var body: some View {
        Button {
            print("Profile Button pressed")
        } label: {
            LazyImage(url: profileImageURL) { state in
                if let image = state.image {
                   image
                        .resizable()
                        .scaledToFit()
                        .clipShape( RoundedRectangle(cornerRadius: 8))
                }
            }
            .frame(width: 36, height: 36)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(.profileButtonBackground))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.stroke, lineWidth: 1))
        }

    }
}

#Preview {
    ProfileButton(profileImageURL: previewUserProfileIcon)
}
