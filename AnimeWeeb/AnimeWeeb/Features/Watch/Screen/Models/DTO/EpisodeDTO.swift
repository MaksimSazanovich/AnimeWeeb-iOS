//
//  EpisodeDTO.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct EpisodeDTO: Codable {
    let id, seasonID, titleID, episodeNumber: Int
    let numberInSeason: Int
    let videos: [VideoDTO]
    let subtitleTracks: [Data] // TODO: Add types
    let playback: PlaybackDTO

    enum CodingKeys: String, CodingKey {
        case id
        case seasonID = "seasonId"
        case titleID = "titleId"
        case episodeNumber, numberInSeason, videos, subtitleTracks, playback
    }
}

extension EpisodeDTO {
    func toDomain() -> Episode {
        Episode(id: id, seasonID: seasonID, animeID: titleID, number: numberInSeason, videos: videos.map { $0.toDomain() })
    }
}
