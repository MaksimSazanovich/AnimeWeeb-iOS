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
        user.toDomain()
    }
}
