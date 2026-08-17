//
//  WatchRepositoryProtocol.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

protocol WatchRepositoryProtocol {
    func fetchEpisode(id: Int) async throws -> Episode
}
