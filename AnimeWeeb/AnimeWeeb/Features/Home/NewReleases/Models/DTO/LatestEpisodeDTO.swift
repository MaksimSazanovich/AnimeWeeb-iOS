//
//  LatestEpisodeDTO.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct LatestEpisodeDTO: Codable {
    let episodeID, titleID: Int
    let titleNameRu, titleNameEn: String
    let posterURL: String
    let seasonNumber: Int
    let seasonName: String
    let episodeNumber, episodeIndex: Int
    let createdAt: String
    let titleObj: TitleDTO
    let seasonObj: SeasonDTO
    let episodeObj: EpisodeDTO

    enum CodingKeys: String, CodingKey {
        case episodeID = "episodeId"
        case titleID = "titleId"
        case titleNameRu, titleNameEn
        case posterURL = "posterUrl"
        case seasonNumber, seasonName, episodeNumber, episodeIndex, createdAt, titleObj, seasonObj, episodeObj
    }
}

extension LatestEpisodeDTO {
    func toDomain() -> NewReleasesAnimeModel {
        NewReleasesAnimeModel(imageURL: URL(string: posterURL), title: titleNameRu, season: seasonNumber, episode: episodeNumber, format: seasonObj.type.toDomain())
    }
}
