//
//  AnimeDetailsViewModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

@MainActor
@Observable
final class AnimeDetailsViewModel {
    var anime: AnimeModel?
    let animeID: Int
    
    init(animeID: Int) {
        self.animeID = animeID
    }
    
    var imageURL: URL? {
        return anime?.imageURL
    }
    
    var title: String {
        return anime?.title ?? "Unknown"
    }
    
    var genres: [Genre] {
        return anime?.genres ?? []
    }
    
    var despription: String {
        return anime?.description ?? "Нет описания"
    }
}
