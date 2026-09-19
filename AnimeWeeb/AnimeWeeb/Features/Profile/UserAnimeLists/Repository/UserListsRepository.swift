//
//  UserListsRepository.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation
import KeychainAccess

final class UserListsRepository: UserListsRepositoryProtocol {
    private let networkService: NetworkServiceProtocol

    public init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func fetchGetMy() async throws -> UserAnimeListsModel {
        let dto: UserListsResponse = try await networkService.request(UserListsEndpoint.getMy)

        return dto.toDomain()
    }

    func fetchPostUserList(titleID: Int, listType: Int) async throws -> String {
        let dto: UserListResponse = try await networkService.request(UserListsEndpoint.postUserList(titleID: titleID, listType: listType))

        return dto.message
    }
}
