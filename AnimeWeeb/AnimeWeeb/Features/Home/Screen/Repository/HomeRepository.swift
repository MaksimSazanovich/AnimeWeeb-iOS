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
        let dto: HomeResponseDTO = try await networkService.request(AnimeEndpoint.getHomeAnimes)

        return dto.toDomain()
    }

    func fetchMoreAnimes(skip: Int, take: Int) async throws -> [AnimeModel] {
        let dto: [TitleDTO] = try await networkService.request(AnimeEndpoint.getAnimes(skip: skip, take: take))
        return dto.map { $0.toDomain() }
    }
}
