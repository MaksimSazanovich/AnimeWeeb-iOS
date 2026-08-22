//
//  GoogleAuthRequestDTO.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

struct GoogleAuthRequestDTO: Encodable {
    let idToken: String
    let deviceId: String
    let deviceName: String
}
