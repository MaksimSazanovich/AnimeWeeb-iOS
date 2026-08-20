//
//  WatchHistoryItem.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct WatchHistoryItem: Identifiable {
    var id: Int { episodeID }

    let title: String
    let imageURL: URL?
    let season: Int
    let episode: Int
    let stoppedAtSeconds: Int

    let titleID: Int
    let episodeID: Int
}
