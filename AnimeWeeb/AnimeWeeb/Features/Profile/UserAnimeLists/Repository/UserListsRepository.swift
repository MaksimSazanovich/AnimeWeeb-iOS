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
    private let keychain: Keychain

    public init(networkService: NetworkServiceProtocol, keychain: Keychain) {
        self.networkService = networkService
        self.keychain = keychain
    }

    func fetchGetMy() async throws -> UserAnimeListsModel {
        guard let accessToken = try keychain.get(KeychainKey.accessToken.rawValue) else {
            throw AuthError.cancelled
        }

        let dto: UserListsResponse = try await networkService.request(UserListsEndpoint.getMy(accessToken: accessToken))

        return dto.toDomain()
    }

    func fetchPostUserList(titleID: Int, listType: Int) async throws -> String {
        guard let accessToken = try keychain.get(KeychainKey.accessToken.rawValue) else {
            throw AuthError.cancelled
        }

        let dto: UserListResponse = try await networkService.request(UserListsEndpoint.postUserList(accessToken: accessToken, titleID: titleID, listType: listType))

        print(dto.message)

        return dto.message
    }
}
