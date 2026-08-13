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
            case .empty:
                Text("Empty")
            case .failed(let error):
                Text("Failed to load: \(error.localizedDescription)")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
        .task {
            await viewModel.loadHomeAnimes()
        }
    }
}

#Preview {
    HomeScreen(viewModel: HomeViewModel(newRealeses: previewNewReleasesAnimeModels, animes: previewAnimeModels))
}



