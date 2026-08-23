//
//  NewReleasesScrollView.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct NewReleasesScrollView: View {

    var animes: [NewReleasesAnimeModel]
    let homeViewModel: HomeViewModel

    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 16) {
                ForEach(animes) { anime in
                    NewReleasesAnimeCard(model: anime) { watchModel in
                        homeViewModel.onRoute?(Screen.watch(model: watchModel))
                    }
                }
            }
            .padding(.bottom, 30)
        }

    }
}
