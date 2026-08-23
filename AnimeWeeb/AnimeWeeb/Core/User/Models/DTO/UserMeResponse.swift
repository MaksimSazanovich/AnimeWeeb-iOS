//
//  UserMeResponse.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct UserMeResponse: Decodable {
    let user: UserDTO
}

extension UserMeResponse {
    func getUser() -> User {
        User(id: user.id, email: user.email, name: user.name, avatarPath: URL(string: user.avatarPath), level: user.level)
    }
}
