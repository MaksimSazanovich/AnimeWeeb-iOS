//
//  WatchRepository.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

final class WatchRepository: WatchRepositoryProtocol {
    
    private let networkService: NetworkServiceProtocol
    
    public init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchEpisode(id: Int) async throws -> Episode {
        let dto: EpisodeDTO = try await networkService.request(EpisodesEndpoint.getEpisode(id: id))
        return dto.toDomain()
    }
}


