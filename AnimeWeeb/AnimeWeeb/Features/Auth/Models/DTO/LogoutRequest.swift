//
//  LogoutRequest.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct LogoutRequest: Encodable {
    let refreshToken: String
    let deviceId: String
    let deviceName: String
}
