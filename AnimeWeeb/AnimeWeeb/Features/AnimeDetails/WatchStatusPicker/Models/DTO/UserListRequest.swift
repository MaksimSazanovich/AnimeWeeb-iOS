//
//  UserListRequest.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct UserListRequest: Encodable {
    let titleID: Int
    let listType: Int

    enum CodingKeys: String, CodingKey {
        case titleID = "titleId"
        case listType
    }
}
