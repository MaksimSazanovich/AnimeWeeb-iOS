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

    let episodeID: Int
    var episode: Episode?
}
