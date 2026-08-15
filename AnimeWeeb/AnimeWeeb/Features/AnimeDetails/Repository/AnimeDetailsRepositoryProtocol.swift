//
//  AnimeDetailsRepositoryProtocol.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//


protocol AnimeDetailsRepositoryProtocol {
    func fetchAnimeDetails(id: Int) async throws -> AnimeModel 
}