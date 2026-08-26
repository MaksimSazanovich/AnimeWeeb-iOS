//
//  LoginConfirmRequest.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct LoginConfirmRequest: Encodable {
    let email: String
    let code: String
    let deviceID: String
    let deviceName: String
}
