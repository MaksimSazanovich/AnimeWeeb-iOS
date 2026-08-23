//
//  Episode.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct Episode: Hashable {
    let seasonID: Int
    let episode: Int
    let videos: [Video]
}
