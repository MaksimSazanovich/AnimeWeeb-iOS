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
    func toDomain() -> Genre {
        switch id {
        case 1: .shounen
        case 2: .adventure
        case 3: .drama
        case 4: .fantasy
        case 5: .suspense
        case 6: .action
        case 7: .comedy
        case 8: .seinen
        case 9: .mystery
        case 10: .supernatural
        case 11: .romance
        case 12: .shoujo
        case 13: .sciFi
        case 14: .horror
        case 15: .sports
        case 16: .gourmet
        case 17: .sliceOfLife
        default:
                .none
        }
    }
}
