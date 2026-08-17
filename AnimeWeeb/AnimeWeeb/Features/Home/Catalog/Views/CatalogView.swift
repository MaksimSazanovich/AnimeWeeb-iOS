//
//  CatalogView.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct CatalogView: View {

    @Bindable var homeViewModel: HomeViewModel
    let viewModel: CatalogViewModel

    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
        self.viewModel = homeViewModel.catalogViewModel
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {

            VStack(alignment: .leading, spacing: 16) {

                VStack(alignment: .leading, spacing: 8) {
                    Text("Каталог")
                        .font(.system(.largeTitle, weight: .semibold))
                        .foregroundStyle(.largeTitle)

                    Text("От ценителей — для ценителей!")
                        .font(.subheadline)
                        .foregroundColor(.subtitle)
                }

                VStack(alignment: .leading, spacing: 12) {
                    // MARK: Search Bar
                    AnimeSearchBar(searchTerm: $homeViewModel.searchTerm, isFocused: $homeViewModel.isSearchFocused)

                    // MARK: Genre Selector
                    AnimeGenrePicker(selectedGenre: $homeViewModel.selectedGenre)
                }

                if !homeViewModel.filteredAnimes.isEmpty {
                    // MARK: Anime Grid
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(homeViewModel.filteredAnimes) { anime in
                            AnimeCard(model: anime) { animeID in
                                homeViewModel.onRouteToDetails?(animeID)
                            }
                            .onAppear {
                                if anime == homeViewModel.filteredAnimes.last {
                                    Task {
                                        await viewModel.loadMoreAnimes(skip: homeViewModel.loadedAnimes.count)
                                    }
                                }
                            }
                        }
                    }

                    // MARK: Pagination State View
                    CatalogPaginationStateView(homeViewModel: homeViewModel, viewModel: viewModel)
                } else {

                    Text("Ничего не найдено. Измените запрос или фильтр.")
                        .font(.system(size: 14))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding(.top, 100)
                }
            }
        }
    }
}
