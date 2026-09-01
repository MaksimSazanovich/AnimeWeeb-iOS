//
//  SeasonExpanableView.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct SeasonExpanableView: View {
    
    let season: Season
    @State var isExpanded: Bool = false
    let selectedEpisode: Episode?
    
    var onSelectEpisode: (Episode, Season) -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Button {
                withAnimation(.easeInOut(duration: 0.25)) {
                    isExpanded.toggle()
                }
            } label: {
                HStack {
                    Text(season.name)
                        .font(.system(.body, weight: .medium))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.menuIcon)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .font(.system(.body, weight: .semibold))
                        .foregroundStyle(.genreText)
                        .rotationEffect(.degrees(isExpanded ? 180 : 0))
                }
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(isExpanded ? .stroke.opacity(0.6) : .clear)
                )
            }
            .buttonStyle(.plain)
            
            if isExpanded {
                VStack(alignment: .leading) {
                    ForEach(season.episodes, id: \.self) { episode in
                        EpisodeRowView(episode: episode, isSelected: episode == selectedEpisode) {
                            onSelectEpisode(episode, season)
                        }
                    }
                }
            }
        }
    }
}
