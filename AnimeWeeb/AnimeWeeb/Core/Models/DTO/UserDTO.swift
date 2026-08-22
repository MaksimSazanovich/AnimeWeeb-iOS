//
//  UserDTO.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

struct UserDTO: Codable {
    let id: Int
    let email, name: String
    let avatarPath: String
    let level, role: Int
    let createdAt: String
}
