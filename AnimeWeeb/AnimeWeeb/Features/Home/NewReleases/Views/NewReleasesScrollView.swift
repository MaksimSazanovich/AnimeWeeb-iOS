//
//  NewReleasesScrollView.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct NewReleasesScrollView: View {
    
    var animes: [NewReleasesAnimeModel]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 16) {
                ForEach(animes) { anime in
                    NewReleasesAnimeCard(model: anime)
                }
            }
            .padding(.bottom, 30)
        }
        
    }
}


