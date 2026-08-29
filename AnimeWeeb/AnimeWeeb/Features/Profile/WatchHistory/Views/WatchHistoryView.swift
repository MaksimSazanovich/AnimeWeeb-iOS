//
//  WatchHistoryView.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct WatchHistoryView: View {

    let viewModel: WatchHistoryViewModel

    var body: some View {
        ZStack {
            switch viewModel.state {
            case .idle, .empty:
                AWEmptyView(title: "История просмотров пока отсутствует. Начните просмотр, чтобы отслеживать свой прогресс здесь!", buttonTitle: "Просмотреть каталог") {
                    viewModel.onRoute?(Screen.home)
                }

            case .loading:
                SkeletonWatchHistory()

            case .loaded:
                VStack(alignment: .leading) {
                    Text("История просмотра")
                        .font(.system(.title, weight: .bold))
                        .foregroundStyle(.largeTitle)

                    LazyVStack {
                        ForEach(viewModel.watchHistory) { model in
                            WatchHistoryCard(model: model) {
                                viewModel.onRoute?(Screen.watch(
                                    model: WatchModel(
                                    titleID: model.titleID,
                                    title: model.title,
                                    season: model.seasonName,
                                    playerProvider: model.playerProvider
                                )))
                            }
                        }
                    }
                }

            case .failed(let error):
                AWErrorView(title: error.localizedDescription)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .task {
            await viewModel.loadWatchHistory()
        }
    }
}
