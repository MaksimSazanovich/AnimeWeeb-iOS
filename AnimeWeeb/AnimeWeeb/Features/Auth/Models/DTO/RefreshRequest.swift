//
//  RefreshRequest.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct RefreshRequest: Encodable {
    let refreshToken: String
    let deviceId: String
    let deviceName: String
}
