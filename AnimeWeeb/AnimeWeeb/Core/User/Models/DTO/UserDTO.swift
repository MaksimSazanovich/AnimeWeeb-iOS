//
//  UserDTO.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct UserDTO: Codable {
    let id: Int
    let email, name: String
    let avatarPath: String
    let level, role: Int
    let createdAt: String
}

extension UserDTO {
    func toDomain() -> User {
        return User(id: id, email: email, name: name, avatarPath: URL(string: avatarPath), level: level)
    }
}
