//
//  RegisterConfirmResponse.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct RegisterConfirmResponse: Decodable {
    let accessToken: String
    let refreshToken: String
    let user: UserDTO
}
