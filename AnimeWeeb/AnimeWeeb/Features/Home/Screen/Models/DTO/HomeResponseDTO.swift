//
//  HomeResponseDTO.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct HomeResponseDTO: Codable {
    let latestEpisodes: [LatestEpisodeDTO]
    let titles: [TitleDTO]
    let totalTitles: Int
}

extension HomeResponseDTO {
    func toDomain() -> HomeModel {
        HomeModel(newReleases: latestEpisodes.map { $0.toDomain() }, animes: titles.map { $0.toDomain() }, totalAnimes: totalTitles)
    }
}
