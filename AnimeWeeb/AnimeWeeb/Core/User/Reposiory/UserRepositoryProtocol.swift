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
}
