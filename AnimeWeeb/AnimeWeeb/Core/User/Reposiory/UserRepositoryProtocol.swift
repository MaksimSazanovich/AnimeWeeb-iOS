//
//  UserRepositoryProtocol.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

protocol UserRepositoryProtocol {
    func fetchUser(accessToken: String) async throws -> User
}
