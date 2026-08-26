//
//  AuthRepositoryProtocol.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

protocol AuthRepositoryProtocol {
    func fetchUserWithGoogle() async throws -> User
    func fetchUserWithGoogle(idToken: String) async throws -> User
    func fetchRefresh() async throws -> RefreshResponse
    func autoLogin() async throws -> User
    func fetchLogout() async throws -> String
    func fetchLoginRequestCode(email: String) async throws -> String
    func fetchLoginConfirm(email: String, code: String) async throws -> User
    func fetchRegisterRequestCode(email: String) async throws -> String
}
