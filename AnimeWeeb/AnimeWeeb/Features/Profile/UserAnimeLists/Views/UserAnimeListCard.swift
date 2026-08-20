//
//  UserAnimeListCard.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import NukeUI
import SwiftUI

struct UserAnimeListCard: View {
    let model: UserAnimeListItem

    var onAction: () -> Void

    var body: some View {
        Button {
            onAction()
        } label: {
            HStack(spacing: 14) {
                LazyImage(url: model.imageURL) { state in
                    if let image = state.image {
                        image
                            .resizable()
                            .aspectRatio(2/3, contentMode: .fit)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 8)
                            )
                    }
                }
                .animeCardBackgroundModifier(cornerRadius: 8, fillOpacity: 0.3, strokeOpacity: 1)

                VStack(alignment: .leading, spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(model.title)
                            .font(.system(.body, weight: .semibold))
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(.mainTitle)
                    }
                }
                .padding(.vertical)
            }
            .padding()
            .frame(height: 128)
            .frame(maxWidth: .infinity, alignment: .leading)
            .animeCardBackgroundModifier(cornerRadius: 16, fillOpacity: 0.3, strokeOpacity: 1)
        }
    }
}
