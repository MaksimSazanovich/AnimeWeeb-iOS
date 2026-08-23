//
//  LogoutRequestDTO.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct LogoutRequestDTO: Encodable {
    let refreshToken: String
    let deviceId: String
    let deviceName: String
}
