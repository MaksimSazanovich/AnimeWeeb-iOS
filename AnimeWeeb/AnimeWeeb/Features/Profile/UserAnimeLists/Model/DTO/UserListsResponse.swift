//
//  UserListsResponse.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

typealias UserListsResponse = [UserListsItemDTO]

extension UserListsResponse {
    func toDomain() -> UserAnimeListsModel {
        self.map { $0.toDomain() }
    }
}
