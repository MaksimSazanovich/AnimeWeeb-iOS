//
//  PlayerProvider.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

enum PlayerProvider: Hashable {
    case native(episodeID: Int)
    case kodik(titleID: Int, seasonNumber: Int, episodeNumber: Int)

    var player: String {
        switch self {
        case .native:
            "native"
        case .kodik:
            "kodik"
        }
    }
}
