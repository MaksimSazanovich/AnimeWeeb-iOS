//
//  HomeViewModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

@Observable
final class HomeViewModel {
    var newRealeses: [NewReleasesAnimeModel]
    var animes: [AnimeModel]
    
    var filteredAnimes: [AnimeModel] {
        animes.filter { $0.genres.contains(selectedGenre) || selectedGenre == .all }
    }
    
    var onRoute: ((AnimeModel) -> Void)?
    
    var selectedGenre: Genre = .all
    
    init(newRealeses: [NewReleasesAnimeModel], animes: [AnimeModel]) {
        self.newRealeses = newRealeses
        self.animes = animes
    }

}
