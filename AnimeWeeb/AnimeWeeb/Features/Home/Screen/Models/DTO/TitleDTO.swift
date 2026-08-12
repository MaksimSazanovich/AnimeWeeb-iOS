//
//  TitleDTO.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct TitleDTO: Codable {
    let id: Int
    let nameRu, nameEn, nameJp: String
    let altNamesRu, altNamesEn: [String]
    let description: String
    let posterURL: String
    let rating: Int
    let status: StatusDTO
    let createdAt: String
    let genres: [GenreDTO]
    let dubbers: [Data] // TODO: Add type

    enum CodingKeys: String, CodingKey {
        case id, nameRu, nameEn, nameJp, altNamesRu, altNamesEn, description
        case posterURL = "posterUrl"
        case rating, status, createdAt, genres, dubbers
    }
}
