//
//  HomeRepositoryProtocol.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

protocol HomeRepositoryProtocol {
    func fetchHomeAnimes() async throws -> HomeModel
    func fetchMoreAnimes(skip: Int, take: Int) async throws -> [AnimeModel]
}
