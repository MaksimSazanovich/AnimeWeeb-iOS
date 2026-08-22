//
//  UserRepository.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

final class UserRepository: UserRepositoryProtocol {
    private let networkService: NetworkServiceProtocol

    public init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchUser(accessToken: String) async throws -> User  {
        let dto: UserMeResponseDTO = try await networkService.request(UserEndpoint.getMe(accessToken: accessToken))
        
        return dto.getUser()
    }
}


