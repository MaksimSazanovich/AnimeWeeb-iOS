//
//  GoogleAuthRequest.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

struct GoogleAuthRequest: Encodable {
    let idToken: String
    let deviceId: String
    let deviceName: String
}
