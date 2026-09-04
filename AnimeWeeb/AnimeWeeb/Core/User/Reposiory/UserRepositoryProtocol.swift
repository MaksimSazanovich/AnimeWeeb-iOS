//
//  UserRepositoryProtocol.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

protocol UserRepositoryProtocol {
    func fetchUser(accessToken: String) async throws -> User
    func fetchUpdate(name: String?, avatar: Data?) async throws -> User
    func fetchGetUserHistory() async throws -> [WatchHistoryItem]
    func fetchPostUserHistory(titleID: Int, episodeID: Int, source: String, seasonNumber: Int, episodeNumber: Int, stoppedAtSeconds: Int) async throws -> String
}
