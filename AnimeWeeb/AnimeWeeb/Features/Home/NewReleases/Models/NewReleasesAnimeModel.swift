//
//  NewReleasesAnimeModel.swift
//  AnimeWeeb
//

import Foundation

struct NewReleasesAnimeModel: Identifiable {
    let id = UUID()
    
    let imageURL: URL?
    let title: String
    let subtitle: String
    let season: Int
    let episode: Int
    
    let isTV: Bool?
}
