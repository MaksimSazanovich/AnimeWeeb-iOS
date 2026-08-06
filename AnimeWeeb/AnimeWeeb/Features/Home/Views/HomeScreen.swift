//
//  HomeScreen.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct HomeScreen: View {
    
    var newRealeses: [NewReleasesAnimeModel]
    @State private var searchTerm: String = ""
    @State private var selectedGenre: Genre = .all
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    let appHeaderViewModel: AppHeaderViewModel
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            
            ScrollView {
                VStack(alignment: .leading) {
                    // MARK: - New Releases
                    Text("Новое на сайте")
                        .font(.system(.largeTitle, weight: .semibold))
                        .foregroundStyle(.largeTitle)
                    
                    VStack(alignment: .leading, spacing: 32) {
                        
                        VStack(spacing: 30) {
                            //MARK: New Releases ScrollView
                            NewReleasesScrollView(animes: newRealeses)
                            
                            Rectangle()
                                .fill(.stroke.opacity(0.8))
                                .frame(height: 1)
                        }
                        
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
                                AnimeSearchBar(searchTerm: $searchTerm)
                                
                                //MARK: Genre Selector
                                AnimeGenrePicker(selectedGenre: $selectedGenre)
                            }
                            
                            // MARK: Anime Grid
                            LazyVGrid(columns: columns, spacing: 16) {
                                ForEach(previewAnimeModels) { anime in
                                    AnimeCard(model: anime)
                                }
                            }
                        }
                        
                    }
                    
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 40)
                .padding(.horizontal)
            }
            .safeAreaInset(edge: .top) {
                // MARK: - App Header
                AppHeaderView(viewModel: appHeaderViewModel)
            }
            .scrollDismissesKeyboard(.immediately)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }
}

#Preview {
    let appURLOpener = AppURLOpener()
    
    HomeScreen(newRealeses: previewNewReleasesAnimeModels, appHeaderViewModel: AppHeaderViewModel(urlOpener: appURLOpener, isLoggedIn: false, user: previewUser))
}


