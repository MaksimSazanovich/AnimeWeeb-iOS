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
    let seasonName: String
    let episode: Int
    let episodeID: Int
    
    let format: AnimeFormat
    
    init(imageURL: URL?, title: String, season: Int, seasonName: String, episode: Int, episodeID: Int, format: AnimeFormat = .none) {
        self.imageURL = imageURL
        self.title = title
        self.season = season
        self.seasonName = seasonName
        self.episode = episode
        self.episodeID = episodeID
        self.format = format
    }
}
