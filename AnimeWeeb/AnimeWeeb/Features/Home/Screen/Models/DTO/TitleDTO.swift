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
    let seasons: [SeasonDTO]?

    enum CodingKeys: String, CodingKey {
        case id, nameRu, nameEn, nameJp, altNamesRu, altNamesEn, description
        case posterURL = "posterUrl"
        case rating, status, createdAt, genres, dubbers, seasons
    }
}

extension TitleDTO {
    func toDomain() -> AnimeModel {
        AnimeModel(
            id: id,
            imageURL: URL(string: posterURL),
            title: nameRu,
            description: description,
            seasons: seasons?.compactMap { $0.toDomain() } ?? [],
            genres: genres.compactMap { $0.toDomain() },
            nameRu: nameRu,
            nameEn: nameEn,
            nameJp: nameJp,
            altNamesRu: altNamesRu,
            altNamesEn: altNamesEn
        )
    }
}
