//
//  HomeScreen.swift
//  AnimeWeeb
//

import SwiftUI

struct HomeScreen: View {
    
    var animes: [NewReleasesAnimeModel]
    
    var body: some View {

        ZStack(alignment: .top) {
            
            
            ScrollView {
                LazyVStack(alignment: .leading) {
                    
                    Text("Новое на сайте")
                        .font(.system(.largeTitle, weight: .semibold))
                        .foregroundStyle(.largeTitle)
                    
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 16) {
                            ForEach(animes) { anime in
                                NewReleasesAnimeCard(model: anime)
                            }
                        }
                        .padding(.bottom, 30)
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 40)
                .padding(.horizontal)
            }
            .safeAreaInset(edge: .top) {
                // MARK: App Header
                AppHeaderView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }
}

#Preview {
    HomeScreen(animes: previewNewReleasesAnimeModels)
}

