//
//  GenreDTO.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct GenreDTO: Codable {
    let id: Int
    let nameRu, nameEn: String
}

extension GenreDTO {
    func toDomain() -> Genre? {
        Genre(rawValue: id)
    }
}
