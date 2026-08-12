//
//  TypeDTO.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

enum TypeDTO: String, Codable {
    case tv = "TV"
    case none
}

extension TypeDTO {
    func toDomain() -> AnimeFormat {
        switch self {
        case .tv: .tv
        case .none: .none
        }
    }
}
