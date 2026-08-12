//
//  NewReleasesAnimeModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct NewReleasesAnimeModel: Identifiable {
    let id = UUID()
    
    let imageURL: URL?
    let title: String
    let season: Int
    let episode: Int
    
    let format: AnimeFormat
    
    init(imageURL: URL?, title: String, season: Int, episode: Int, format: AnimeFormat = .none) {
        self.imageURL = imageURL
        self.title = title
        self.season = season
        self.episode = episode
        self.format = format
    }
}
