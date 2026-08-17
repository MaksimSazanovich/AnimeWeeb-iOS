//
//  SeasonDTO.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct SeasonDTO: Codable {
    let id, titleID: Int
    let name, seasonName: String
    let seasonNumber, sortOrder: Int
    let type: TypeDTO
    let episodesCount: Int
    let releaseDate: String
    let status: StatusDTO
    let description: String
    let episodes: [EpisodeDTO]
    let shikimoriID: String

    enum CodingKeys: String, CodingKey {
        case id
        case titleID = "titleId"
        case name, seasonName, seasonNumber, sortOrder, type, episodesCount, releaseDate, status, description, episodes
        case shikimoriID = "shikimoriId"
    }
}
