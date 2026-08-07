//
//  AnimeDetailsViewModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

@Observable
final class AnimeDetailsViewModel {
    var anime: AnimeModel
    
    init(anime: AnimeModel) {
        self.anime = anime
    }
}
