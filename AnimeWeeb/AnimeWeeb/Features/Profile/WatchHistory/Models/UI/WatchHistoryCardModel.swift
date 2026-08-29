//
//  WatchHistoryCardModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct WatchHistoryCardModel: Identifiable {
    var id: Int { titleID }

    let title: String
    let imageURL: URL?
    let season: Int
    let seasonName: String
    let episode: Int
    let stoppedAtSeconds: Int

    let titleID: Int
    let playerProvider: PlayerProvider
}
