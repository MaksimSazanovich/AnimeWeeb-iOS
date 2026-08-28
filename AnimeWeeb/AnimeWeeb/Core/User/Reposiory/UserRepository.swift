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
        print(name ?? "nil", accessToken.isEmpty)
        let dto: UserUpdateResponse = try await networkService.request(UserEndpoint.update(accessToken: accessToken, name: name, avatar: avatar))
        print(dto)
        return dto.user.toDomain()
    }
}
