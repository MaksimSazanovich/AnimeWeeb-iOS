//
//  AnimeDetailsScreen.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import NukeUI
import SwiftUI
import TagCloud

struct AnimeDetailsScreen: View {

    @State var viewModel: AnimeDetailsViewModel

    var body: some View {

        ZStack {
            switch viewModel.state {
            case .idle, .loading:
                SkeletonAnimeDetailsContentView()

            case .loaded:
                AnimeDetailsContentView(viewModel: viewModel)

            case .empty, .failed:
                AnimeDetailsErrorView {
                    viewModel.onRoute?(.home)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
        .task {
            await viewModel.loadDetails()
        }
    }
}

#Preview {
    VStack(spacing: 0) {

        AppHeaderView(viewModel: AppHeaderViewModel(urlOpener: AppURLOpener()))

        AnimeDetailsScreen(viewModel: AnimeDetailsViewModel(animeID: previewAnimeModel.id, repository: AnimeDetailsRepository(networkService: NetworkService())))
    }

}
