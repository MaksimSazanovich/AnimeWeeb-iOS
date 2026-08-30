//
//  UserListsRepositoryProtocol.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

protocol UserListsRepositoryProtocol {
    func fetchGetMy() async throws -> UserAnimeListsModel
    func fetchPostUserList(titleID: Int, listType: Int) async throws -> String
}
