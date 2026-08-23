//
//  GoogleAuthRequest.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

struct GoogleAuthRequest: Encodable {
    let idToken: String
    let deviceID: String
    let deviceName: String

    enum CodingKeys: String, CodingKey {
        case idToken
        case deviceID = "deviceId"
        case deviceName
    }
}
