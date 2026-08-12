//
//  HomeResponse.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct HomeResponse: Codable {
    let latestEpisodes: [LatestEpisodeDTO]
    let titles: [TitleDTO]
    let totalTitles: Int
}
