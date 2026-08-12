//
//  PlaybackDTO.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct PlaybackDTO: Codable {
    let defaultMode: DefaultModeDTO
    let standardEnabled, learningEnabled: Bool
}
