//
//  HomeRepository.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

final class HomeRepository: HomeRepositoryProtocol {
    private let networkService: NetworkServiceProtocol
    
    public init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchHomeAnimes() async throws -> HomeModel {
        let dto: HomeResponse = try await networkService.request(AnimeEndpoint.getHomeAnimes)
        
        return dto.toDomain()
    }
}
