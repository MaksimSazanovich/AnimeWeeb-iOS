//
//  ProfileButton.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import NukeUI
import SwiftUI

struct ProfileButton: View {

    var avatarURL: URL?
    var onAction: () -> Void

    var body: some View {
        Button {
            onAction()
        } label: {
            LazyImage(url: avatarURL) { state in
                if let image = state.image {
                   image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
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
    ProfileButton(avatarURL: previewUserAvatarURL) {}
}
