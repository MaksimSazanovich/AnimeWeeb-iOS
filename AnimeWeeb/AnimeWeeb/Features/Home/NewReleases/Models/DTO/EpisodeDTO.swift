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
    let videos, subtitleTracks: [Data] // TODO: Add types
    let playback: PlaybackDTO

    enum CodingKeys: String, CodingKey {
        case id
        case seasonID = "seasonId"
        case titleID = "titleId"
        case episodeNumber, numberInSeason, videos, subtitleTracks, playback
    }
}
