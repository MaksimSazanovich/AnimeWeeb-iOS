//
//  UserListsRepositoryProtocol.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

protocol UserListsRepositoryProtocol {
    func fetchGetMy() async throws -> UserAnimeListsModel
}
