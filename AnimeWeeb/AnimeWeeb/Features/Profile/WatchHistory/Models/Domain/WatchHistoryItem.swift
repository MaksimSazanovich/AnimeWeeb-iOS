//
//  WatchHistoryItem.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct WatchHistoryItem {
    let season: Int
    let episode: Int
    let stoppedAtSeconds: Int

    let titleID: Int
    let playerProvider: PlayerProvider
}
