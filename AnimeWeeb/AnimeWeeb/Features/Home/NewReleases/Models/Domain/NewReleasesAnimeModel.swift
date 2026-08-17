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
    let titleID: Int
    let title: String
    let season: Int
    let seasonName: String
    let episode: Int
    let episodeID: Int
    
    let format: AnimeFormat
    
    init(imageURL: URL?, titleID: Int, title: String, season: Int, seasonName: String, episode: Int, episodeID: Int, format: AnimeFormat) {
        self.imageURL = imageURL
        self.titleID = titleID
        self.title = title
        self.season = season
        self.seasonName = seasonName
        self.episode = episode
        self.episodeID = episodeID
        self.format = format
    }
}
