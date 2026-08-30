//
//  SeasonDTO.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct SeasonDTO: Codable {
    let id: Int
    let titleID: Int
    let name: String
    let seasonName: String
    let seasonNumber: Int
    let sortOrder: Int
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

extension SeasonDTO {
    func toDomain() -> Season {
        Season(
            id: id,
            titleID: titleID,
            name: name,
            seasonName: seasonName,
            seasonNumber: seasonNumber,
            sortOrder: sortOrder,
            type: type.rawValue,
            episodesCount: episodesCount,
            releaseDate: releaseDate,
            status: status.rawValue,
            description: description,
            episodes: episodes.map { $0.toDomain() },
            shikimoriID: shikimoriID
        )
    }
}
