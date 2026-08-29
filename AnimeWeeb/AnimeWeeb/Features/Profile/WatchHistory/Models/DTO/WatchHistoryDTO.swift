//
//  WatchHistoryDTO.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

struct WatchHistoryDTO: Codable {
    let animeID: Int
    let episodeID: Int?
    let stoppedAtSeconds, seasonNumber, numberInSeason: Int
    let source: String
    let provider: String?

    enum CodingKeys: String, CodingKey {
        case animeID = "animeId"
        case episodeID = "episodeId"
        case stoppedAtSeconds, seasonNumber, numberInSeason, source, provider
    }
}

extension WatchHistoryDTO {
    func toDomain() -> WatchHistoryItem {
        WatchHistoryItem(season: seasonNumber, episode: numberInSeason, stoppedAtSeconds: stoppedAtSeconds, titleID: animeID, playerProvider: playerProvider)
    }

    var playerProvider: PlayerProvider {
        let value = (provider ?? source).lowercased()

        switch value {
        case "kodik":
            return PlayerProvider.kodik(titleID: animeID, seasonNumber: seasonNumber, episodeNumber: numberInSeason)
        default:
            return PlayerProvider.native(episodeID: episodeID ?? 0)
        }
    }
}
