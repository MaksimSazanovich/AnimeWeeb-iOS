//
//  AnimeModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct AnimeModel: Identifiable {
    let id = UUID()
    
    let imageURL: URL?
    let title: String
    let genres: [Genre]
}
