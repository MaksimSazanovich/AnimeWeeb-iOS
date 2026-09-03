//
//  WatchModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct WatchModel: Hashable {

    let animeID: Int
    let title: String

    let season: String

    let playerProvider: PlayerProvider
    var episode: Episode?
    var seasons: [Season]?
    var timecode: Double?
}
