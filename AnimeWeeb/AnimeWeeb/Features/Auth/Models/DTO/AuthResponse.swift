//
//  AuthResponse.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

struct AuthResponse: Decodable {
    let accessToken: String
    let refreshToken: String
    let user: UserDTO
}
