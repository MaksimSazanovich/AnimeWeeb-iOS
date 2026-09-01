//
//  Episode.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct Episode: Hashable {
    let id: Int
    let seasonID: Int
    let animeID: Int
    let number: Int
    let videos: [Video]
}
