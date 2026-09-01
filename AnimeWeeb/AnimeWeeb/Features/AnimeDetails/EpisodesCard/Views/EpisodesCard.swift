//
//  EpisodesCard.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct EpisodesCard: View {
    
    @State var episodesCount: Int
    let seasons: [Season]
    let selectedEpisode: Episode?
    
    var onSelectEpisode: (Episode, Season) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            VStack(alignment: .leading) {
                Text("Эпизоды")
                    .font(.system(.body, weight: .semibold))
                    .foregroundStyle(.largeTitle)
                
                Text("\(episodesCount) эпизодов")
                    .font(.footnote)
                    .foregroundStyle(.genreText)
            }
            
            AWDivider()
                .padding(.horizontal, -16)
            
            VStack(alignment: .leading) {
                ForEach(seasons, id: \.self) { season in
                    SeasonExpanableView(season: season, isExpanded: season == seasons.first, selectedEpisode: selectedEpisode) { episode, season in
                        onSelectEpisode(episode, season)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .animeCardBackgroundModifier()
    }
}

#Preview {
    VStack {
        EpisodesCard(episodesCount: 10, seasons: previewSeasons, selectedEpisode: previewSeasons.first?.episodes.first) {_, _ in}
        
        Spacer()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.background)
}
