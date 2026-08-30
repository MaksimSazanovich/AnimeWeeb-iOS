//
//  AnimeDetailsRepository.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

final class AnimeDetailsRepository: AnimeDetailsRepositoryProtocol {

    private let networkService: NetworkServiceProtocol

    public init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func fetchAnimeDetails(id: Int) async throws -> AnimeModel {
        let dto: TitleDTO = try await networkService.request(AnimeEndpoint.getAnime(id: id))
        return dto.toDomain()
    }
}
