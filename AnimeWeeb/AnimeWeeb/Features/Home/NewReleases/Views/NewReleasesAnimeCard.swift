//
//  NewReleasesAnimeCard.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI
import NukeUI

struct NewReleasesAnimeCard: View {
    
    let model: NewReleasesAnimeModel
    
    var body: some View {
        ZStack {
            VStack() {
                // MARK: Image
                LazyImage(url: model.imageURL) { state in
                    if let image = state.image {
                        image
                            .resizable()
                            .aspectRatio(2/3, contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .overlay(alignment: .topLeading) {
                                // MARK: New Tag
                                Text("НОВОЕ")
                                    .font(.system(.caption, weight: .bold))
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 5)
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(.newBadgeBackground)
                                    )
                                    .padding(8)
                            }
                            .overlay(alignment: .topTrailing) {
                                // MARK: TV Tag
                                if model.format == .tv
                                {
                                    Text("TV")
                                        .font(.system(.caption, weight: .bold))
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 5)
                                        .background(
                                            RoundedRectangle(cornerRadius: 8)
                                                .fill(Color.background.opacity(0.8))
                                        )
                                        .padding(8)
                                }
                            }
                    }
                }
                
                VStack(alignment: .leading) {
                    //MARK: Title
                    ZStack(alignment: .topLeading) {
                        Text(model.title)
                            .font(.system(.subheadline, weight: .medium))
                            .lineLimit(2, reservesSpace: true)
                    }
                    
                    
                    //                    //MARK: Subtitle
                    //                    Text(model.subtitle)
                    //                        .font(.caption)
                    //                        .foregroundStyle(.subtitle)
                    //                        .lineLimit(1)
                    
                    //MARK: Season Badge
                    Text("Сезон \(model.season), эпизод \(model.episode)")
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                        .font(.system(.caption, weight: .medium))
                        .foregroundStyle(.seasonBadgeText)
                        .frame(maxWidth: .infinity)
                        .padding(7)
                        .background(
                            RoundedRectangle(cornerRadius: 6)
                                .fill(.seasonBadge.opacity(0.1))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.seasonBadge.opacity(0.2), lineWidth: 1)
                        )
                    
                }
                .padding(12)
            }
            
            
            
        }
        .frame(width: 150) //TODO: Hardcode width
        .animeCardBackgroundModifier(cornerRadius: 12)
    }
}
