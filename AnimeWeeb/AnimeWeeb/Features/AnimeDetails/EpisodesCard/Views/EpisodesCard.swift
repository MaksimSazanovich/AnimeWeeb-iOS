//
//  EpisodesCard.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct EpisodesCard: View {
    
    @State var episodesCount: Int = 10
    let seasons: [Season]
    
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
                    SeasonExpanableView(season: season, isExpanded: season == seasons.first)
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
        EpisodesCard(seasons: previewSeasons)
        
        Spacer()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.background)
}




