//
//  Season.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

struct Season: Hashable {
    let id, titleID: Int
    let name, seasonName: String
    let seasonNumber, sortOrder: Int
    let type: String
    let episodesCount: Int
    let releaseDate, status, description: String
    let episodes: [Episode]
    let shikimoriID: String
}
