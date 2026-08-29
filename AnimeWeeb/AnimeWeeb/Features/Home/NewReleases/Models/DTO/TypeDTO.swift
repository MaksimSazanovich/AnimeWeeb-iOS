//
//  TypeDTO.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

enum TypeDTO: String, Codable {
    case tv = "TV"
       case tvSpecial = "TV Спецвыпуск"
       case film = "FILM"
       case unknown

       init(from decoder: Decoder) throws {
           let raw = try decoder.singleValueContainer().decode(String.self)
           self = .init(rawValue: raw) ?? .unknown
       }

       func encode(to encoder: Encoder) throws {
           var container = encoder.singleValueContainer()
           try container.encode(rawValue)
       }
}

extension TypeDTO {
    func toDomain() -> AnimeFormat {
        switch self {
        case .tv: .tv
        case .tvSpecial: .tvSpecial
        case .film: .film
        case .unknown: .unknown
        }
    }
}
