//
//  WatchModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct WatchModel: Hashable {

    let titleID: Int
    let title: String

    let season: String

    let playerProvider: PlayerProvider
    var episode: Episode?
}
