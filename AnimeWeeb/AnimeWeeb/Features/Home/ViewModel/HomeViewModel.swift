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
    
    var onRoute: ((AnimeModel) -> Void)?
    
    init(newRealeses: [NewReleasesAnimeModel], animes: [AnimeModel]) {
        self.newRealeses = newRealeses
        self.animes = animes
    }
}
