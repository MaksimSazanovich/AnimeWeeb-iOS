//
//  AnimeCard.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI
import NukeUI
import TagCloud

struct AnimeCard: View {
    
    let model: AnimeModel
    
    var onAction: (AnimeModel) -> Void
    
    private let maxVisibleTags = 3
    
    private var displayTagItems: [TagItem] {
        if model.genres.count <= maxVisibleTags {
            return model.genres.map { TagItem.tag($0) }
        }
        
        let visibleTags = model.genres.prefix(maxVisibleTags).map { TagItem.tag($0) }
        let overflow = model.genres.count - maxVisibleTags
        return visibleTags + [.overflow(overflow)]
    }
    
    var body: some View {
        
        Button {
            onAction(model)
        } label: {
            VStack(alignment: .leading) {
                // MARK: Image
                LazyImage(url: model.imageURL) { state in
                    if let image = state.image {
                        image
                            .resizable()
                            .aspectRatio(2/3, contentMode: .fit)
                            .clipShape(
                                UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(
                                    topLeading: 12,
                                    bottomLeading: 0,
                                    bottomTrailing: 0,
                                    topTrailing: 12))
                            )
                    }
                }
                
                VStack(alignment: .leading) {
                    //MARK: Title
                    Text(model.title)
                        .font(.system(.body, weight: .medium))
                        .foregroundStyle(.mainTitle)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    
                    
                    // MARK: Tag Cloud
                    TagCloudView(data: displayTagItems, verticalSpacing: 4, horizontalSpacing: 4) { tagItem in
                        
                        switch tagItem {
                        case .tag(let genre):
                            Text(genre.rawValue.uppercased())
                                .font(.system(.caption2, weight: .medium))
                                .foregroundStyle(.subtitle)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 3)
                                .background(
                                    RoundedRectangle(cornerRadius: 6)
                                        .fill(.stroke.opacity(0.8))
                                )
                        case .overflow(let count):
                            Text("+\(count)")
                                .font(.caption)
                                .foregroundStyle(.genreText)
                        }
                        
                    }
                }
                .padding(12)
                
                Spacer(minLength: 0)
            }
            .animeCardBackgroundModifier(cornerRadius: 12)
        }
        
        
        
    }
}

#Preview {
    AnimeCard(model: previewAnimeModel, onAction: {_ in })
}
