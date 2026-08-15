//
//  AnimeDetailsContentView.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI
import NukeUI
import TagCloud

struct AnimeDetailsContentView: View {
    
    let viewModel: AnimeDetailsViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // MARK: Image
                LazyImage(url: viewModel.imageURL) { state in
                    if let image = state.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .clipShape(
                                RoundedRectangle(cornerRadius: 12)
                            )
                    }
                }
                .animeCardBackgroundModifier(cornerRadius: 12, strokeOpacity: 1)
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 12) {
                    // MARK: Title
                    Text(viewModel.title)
                        .font(.system(size: 30, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // MARK: Tag Cloud
                    TagCloudView(data: viewModel.genres) { genre in
                        Text(genre.rawValue.uppercased())
                            .font(.system(.body, weight: .medium))
                            .foregroundStyle(.subtitle)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 4)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(.stroke.opacity(0.8))
                            )
                    }
                    
                    // MARK: Description
                    Text(viewModel.despription)
                        .font(.system(.body))
                        .foregroundStyle(.subtitle)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 50)
            .padding(.horizontal)
        }
    }
}

