//
//  RefreshResponse.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct RefreshResponse: Decodable {
    let accessToken: String
    let refreshToken: String
}
