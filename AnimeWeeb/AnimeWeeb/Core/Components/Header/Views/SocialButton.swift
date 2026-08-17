//
//  SocialButton.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct SocialButton: View {

    let socialMedia: SocialMedia

    let onAction: (SocialMedia) -> Void

    var body: some View {
        Button {
            onAction(socialMedia)
        } label: {
            Label(socialMedia.rawValue, image: socialMedia.image)
                .font(.system(.body, weight: .medium))
                .foregroundStyle(.subtitle)
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                .padding(.vertical, 12)
                .animeCardBackgroundModifier()
        }
    }

    init(for socialMedia: SocialMedia, onAction: @escaping (SocialMedia) -> Void) {
        self.socialMedia = socialMedia
        self.onAction = onAction
    }
}
