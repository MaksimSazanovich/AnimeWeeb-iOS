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
        animes.filter { ($0.genres.contains(selectedGenre) || selectedGenre == .all) && ($0.title.localizedCaseInsensitiveContains(searchTerm) || searchTerm.isEmpty) }
    }
    
    var onRoute: ((AnimeModel) -> Void)?
    
    var selectedGenre: Genre = .all
    var searchTerm: String = ""
    var isSearchFocused: Bool = false
    
    init(newRealeses: [NewReleasesAnimeModel], animes: [AnimeModel]) {
        self.newRealeses = newRealeses
        self.animes = animes
    }

}
