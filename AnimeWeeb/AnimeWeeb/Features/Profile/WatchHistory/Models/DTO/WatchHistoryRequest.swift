//
//  WatchHistoryRequest.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

struct WatchHistoryRequest: Encodable {
    let titleID: Int
    let episodeID: Int
    let source: String
    let seasonNumber: Int
    let episodeNumber: Int
    let stoppedAtSeconds: Int

    enum CodingKeys: String, CodingKey {
        case titleID = "titleId"
        case episodeID = "episodeId"
        case source, seasonNumber, episodeNumber, stoppedAtSeconds
    }
}
