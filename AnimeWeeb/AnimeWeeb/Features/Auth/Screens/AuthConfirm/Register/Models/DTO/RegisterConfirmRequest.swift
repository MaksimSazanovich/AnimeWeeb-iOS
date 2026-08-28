//
//  RegisterConfirmRequest.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct RegisterConfirmRequest: Encodable {
    let email: String
    let code: String
    let name: String
    let deviceID: String
    let deviceName: String

    let avatarData: Data

    enum CodingKeys: String, CodingKey {
        case email = "Email"
        case code = "Code"
        case name = "Name"
        case deviceID = "DeviceId"
        case deviceName = "DeviceName"
    }
}
