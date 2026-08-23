//
//  LogoutRequest.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct LogoutRequest: Encodable {
    let refreshToken: String
    let deviceID: String
    let deviceName: String

    enum CodingKeys: String, CodingKey {
        case refreshToken
        case deviceID = "deviceId"
        case deviceName
    }
}
