//
//  RefreshResponseDTO.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct RefreshResponseDTO: Decodable {
    let accessToken: String
    let refreshToken: String
}
