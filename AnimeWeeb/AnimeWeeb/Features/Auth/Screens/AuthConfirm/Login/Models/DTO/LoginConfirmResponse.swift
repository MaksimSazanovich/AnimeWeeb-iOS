//
//  LoginConfirmResponse.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct LoginConfirmResponse: Decodable {
    let accessToken: String
    let refreshToken: String
    let user: UserDTO
}
