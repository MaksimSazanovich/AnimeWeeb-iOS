//
//  RefreshRequestDTO.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct RefreshRequestDTO: Encodable {
    let refreshToken: String
    let deviceId: String
    let deviceName: String
}
