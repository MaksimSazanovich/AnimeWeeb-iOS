//
//  WatchHistoryCard.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import NukeUI
import Shimmer
import SwiftUI

struct WatchHistoryCard: View {
    let model: WatchHistoryCardModel

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
                            .lineLimit(1)
                            .foregroundStyle(.mainTitle)

                        Text("Сезон \(model.season), Серия \(model.episode)")
                            .font(.system(.caption, weight: .medium))
                            .foregroundStyle(.genreText)
                    }

                    Text("\(model.stoppedAtSeconds.timecode)")
                        .font(.system(.caption, weight: .semibold))
                        .foregroundStyle(.genreText)
                        .offset(y: -6)
                }
                .padding(.vertical)

                Spacer()

                VStack {
                    Spacer()

                    Image(systemName: "play.circle")
                        .font(.system(size: 14))
                        .foregroundStyle(.subtitle)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.stroke.opacity(0.8))
                                .frame(width: 30, height: 30)
                        )
                        .frame(width: 30, height: 30)
                }
                .padding(.leading, 10)

            }
            .padding()
            .frame(height: 128)
            .frame(maxWidth: .infinity, alignment: .leading)
            .animeCardBackgroundModifier(cornerRadius: 16, fillOpacity: 0.3, strokeOpacity: 1)
        }
    }
}

#Preview {
    LazyVStack {
        ForEach(previewWatchHistory) { model in
            WatchHistoryCard(model: model) {

            }
        }
    }
}
