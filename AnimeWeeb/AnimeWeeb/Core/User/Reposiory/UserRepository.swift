//
//  UserRepository.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation
import KeychainAccess

final class UserRepository: UserRepositoryProtocol {
    private let networkService: NetworkServiceProtocol
    private let keychain: Keychain

    public init(networkService: NetworkServiceProtocol, keychain: Keychain) {
        self.networkService = networkService
        self.keychain = keychain
    }

    func fetchUser(accessToken: String) async throws -> User {
        let dto: UserMeResponse = try await networkService.request(UserEndpoint.getMe(accessToken: accessToken))

        return dto.getUser()
    }

    func fetchUpdate(name: String?, avatar: Data?) async throws -> User {

        guard let accessToken = try keychain.get(KeychainKey.accessToken.rawValue) else {
            throw AuthError.cancelled
        }

        let dto: UserUpdateResponse = try await networkService.request(UserEndpoint.update(accessToken: accessToken, name: name, avatar: avatar))

        return dto.user.toDomain()
    }

    func fetchGetUserHistory() async throws -> [WatchHistoryItem] {
        guard let accessToken = try keychain.get(KeychainKey.accessToken.rawValue) else {
            throw AuthError.cancelled
        }

        let dto: WatchHistoryResponse = try await networkService.request(UserEndpoint.getWatchHistory(accessToken: accessToken))

        return dto.toDomain()
    }

    func fetchPostUserHistory(titleID: Int, episodeID: Int, source: String, seasonNumber: Int, episodeNumber: Int, stoppedAtSeconds: Int) async throws -> String {
        guard let accessToken = try keychain.get(KeychainKey.accessToken.rawValue) else {
            throw AuthError.cancelled
        }

        let dto: WatchHistoryPostResponse = try await networkService.request(
            UserEndpoint.postWatchHistory(
                accessToken: accessToken,
                titleID: titleID,
                episodeID: episodeID,
                source: source,
                seasonNumber: seasonNumber,
                episodeNumber: episodeNumber,
                stoppedAtSeconds: stoppedAtSeconds
            )
        )

        return dto.message
    }
}
