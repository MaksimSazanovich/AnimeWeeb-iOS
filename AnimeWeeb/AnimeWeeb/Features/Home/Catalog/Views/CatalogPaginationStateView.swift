//
//  CatalogPaginationStateView.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct CatalogPaginationStateView: View {

    @Bindable var homeViewModel: HomeViewModel
    let viewModel: CatalogViewModel

    var body: some View {
        switch viewModel.state {
        case .idle, .empty, .loaded:
            EmptyView()

        case .loading:
            CatalogProgressView()
                .frame(maxWidth: .infinity)
                .padding()

        case .failed:
            CatalogErrorView {
                Task {
                    await viewModel.loadMoreAnimes(skip: homeViewModel.filteredAnimes.count)
                }
            }
        }
    }
}
