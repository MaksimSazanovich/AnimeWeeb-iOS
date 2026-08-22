//
//  AuthResponseDTO.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//


struct AuthResponseDTO: Decodable {
    let accessToken: String
    let refreshToken: String
    let user: UserDTO
}
