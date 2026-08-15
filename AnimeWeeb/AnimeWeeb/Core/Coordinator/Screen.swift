//
//  Screen.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

enum Screen: ComplexEquatable {
    case home
    case login
    case register
    case animeDetails(animeID: Int)
    case watch(model: WatchModel)
    case profile
}
