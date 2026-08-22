//
//  AuthRepositoryProtocol.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

protocol AuthRepositoryProtocol {
    func fetchUserWithGoogle() async throws -> User
}
