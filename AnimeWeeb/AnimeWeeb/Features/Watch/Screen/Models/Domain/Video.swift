//
//  Video.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct Video: Hashable {
    let dubberName: String
    let quality: QualityType
    let url: URL?
}
