//
//  HomeContentView.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct HomeContentView: View {
    
    @Bindable var viewModel: HomeViewModel
    
    var body: some View {
        ScrollView {
            ScrollViewReader { proxy in
                VStack(alignment: .leading) {
                    
                    if !viewModel.isSearchFocused && viewModel.searchTerm.isEmpty {
                        // MARK: - New Releases
                        NewReleasesView(animes: viewModel.newReleases)
                    }
                    
                    // MARK: - Catalog
                    CatalogView(homeViewModel: viewModel)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
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
    }
}

