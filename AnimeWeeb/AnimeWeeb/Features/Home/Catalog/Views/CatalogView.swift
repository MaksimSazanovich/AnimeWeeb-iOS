//
//  CatalogView.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct CatalogView: View {
    
    @Bindable var viewModel: HomeViewModel
    
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            
            VStack(alignment: .leading, spacing: 16) {
                
                VStack(alignment: .leading, spacing: 8){
                    Text("Каталог")
                        .font(.system(.largeTitle, weight: .semibold))
                        .foregroundStyle(.largeTitle)
                    
                    Text("От ценителей — для ценителей!")
                        .font(.subheadline)
                        .foregroundColor(.subtitle)
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    // MARK: Search Bar
                    AnimeSearchBar(searchTerm: $viewModel.searchTerm, isFocused: $viewModel.isSearchFocused)
                    
                    //MARK: Genre Selector
                    AnimeGenrePicker(selectedGenre: $viewModel.selectedGenre)
                }
                
                if !viewModel.filteredAnimes.isEmpty {
                    // MARK: Anime Grid
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(viewModel.filteredAnimes) { anime in
                            AnimeCard(model: anime) { anime in
                                viewModel.onRoute?(anime)
                            }
                        }
                    }
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
