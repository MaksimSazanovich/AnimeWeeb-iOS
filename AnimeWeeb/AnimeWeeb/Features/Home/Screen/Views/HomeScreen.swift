//
//  HomeScreen.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct HomeScreen: View {

    @State var viewModel: HomeViewModel

    var body: some View {

        ZStack {
            switch viewModel.state {

            case .idle, .loading:
                SkeletonHomeContentView()

            case .loaded:
                HomeContentView(viewModel: self.viewModel)

            case .empty, .failed:
                CatalogErrorView {
                    Task {
                        await viewModel.loadHomeAnimes()
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 105)
        .background(Color.background)
        .task {
            await viewModel.loadHomeAnimes()
        }
    }
}

#Preview {
    HomeScreen(viewModel: HomeViewModel(newRealeses: previewNewReleasesAnimeModels, animes: previewAnimeModels))
}
