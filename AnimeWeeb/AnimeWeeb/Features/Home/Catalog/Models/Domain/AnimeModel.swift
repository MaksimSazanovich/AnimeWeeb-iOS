//
//  AnimeModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct AnimeModel: Identifiable, Hashable {
    let id: Int
    
    let imageURL: URL?
    let title: String
    let description: String?
    let genres: [Genre]
    
    let nameRu, nameEn, nameJp: String
    let altNamesRu, altNamesEn: [String]
}
