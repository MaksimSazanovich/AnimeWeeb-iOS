//
//  WatchScreen.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct WatchScreen: View {

    @Bindable var viewModel: WatchViewModel

    var body: some View {
        ZStack {
            switch viewModel.state {
            case .idle, .loading:
                SkeletonWatchContentView()
            case .empty:
                AWEmptyView(title: "Серия не доступна, попробуйте позже", buttonTitle: "В каталог") {
                    viewModel.didTapCatalog()
                }
            case .loaded:
               WatchContentView(viewModel: viewModel)
            case .failed(let error):
                AWErrorView(title: error.localizedDescription)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 50)
        .padding(.horizontal)
        .background(Color.background)
        .task {
            await viewModel.loadEpisode()
        }
    }
}
