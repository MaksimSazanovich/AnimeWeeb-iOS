//
//  HomeScreen.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct HomeScreen: View {
    
    @State var viewModel: HomeViewModel
    let namespace: Namespace.ID
    
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        
        ScrollView {
            ScrollViewReader { proxy in
                VStack(alignment: .leading) {
                    
                    if !viewModel.isSearchFocused && viewModel.searchTerm.isEmpty {
                        // MARK: - New Releases
                        NewReleasesView(animes: viewModel.newRealeses)
                    }
                    
                    VStack(alignment: .leading, spacing: 32) {
                        // MARK: - Catalog
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
                                        .matchedTransitionSource(id: anime.id, in: namespace)
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
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 40)
                .padding(.horizontal)
                .id("scrollTop")
                .onChange(of: viewModel.searchTerm) { _, newValue in
                    if !newValue.isEmpty {
                        proxy.scrollTo("scrollTop", anchor: .top)
                    }
                }
            }
        }
        .dismissKeyboardOnTap()
        .onTapGesture {
            viewModel.isSearchFocused = false
        }
        .scrollDismissesKeyboard(.immediately)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }
}

#Preview {
    @Previewable @Namespace var animeNamespace
    VStack(spacing: 0){
        
        AppHeaderView(viewModel: AppHeaderViewModel(urlOpener: AppURLOpener()))
        
        HomeScreen(viewModel: HomeViewModel(newRealeses: previewNewReleasesAnimeModels, animes: previewAnimeModels), namespace: animeNamespace)
    }
}


