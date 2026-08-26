//
//  AuthRepository.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation
import KeychainAccess
import UIKit

final class AuthRepository: AuthRepositoryProtocol {
    private let networkService: NetworkServiceProtocol
    private let googleService: GoogleService
    private let userRepository: UserRepositoryProtocol
    
    private let keychain = Keychain(service: "MS.AnimeWeeb")
        .accessibility(.whenUnlocked)
    
    private let deviceID = UIDevice.deviceID
    private let deviceName = UIDevice.deviceName
    
    public init(networkService: NetworkServiceProtocol, googleService: GoogleService, userRepository: UserRepositoryProtocol) {
        self.networkService = networkService
        self.googleService = googleService
        self.userRepository = userRepository
    }
    
    func fetchUserWithGoogle() async throws -> User {
        let idToken = try await googleService.getGoogleIDToken()
        
        let dto: AuthResponse = try await networkService.request(AuthEndpoint.google(idToken: idToken, deviceID: self.deviceID, deviceName: self.deviceName))
        
        try keychain.set(dto.accessToken, key: KeychainKey.accessToken.rawValue)
        try keychain.set(dto.refreshToken, key: KeychainKey.refreshToken.rawValue)
        
        print("\(dto.accessToken)\n")
        print(dto.refreshToken)
        print("deviceID: \(UIDevice.deviceID)")
        print("deviceName: \(UIDevice.deviceName)")
        
        return dto.user.toDomain()
    }
    
    func fetchUserWithGoogle(idToken: String) async throws -> User {
        let dto: AuthResponse = try await networkService.request(AuthEndpoint.google(idToken: idToken, deviceID: self.deviceID, deviceName: self.deviceName))
        
        try keychain.set(dto.accessToken, key: KeychainKey.accessToken.rawValue)
        try keychain.set(dto.refreshToken, key: KeychainKey.refreshToken.rawValue)
        
        return dto.user.toDomain()
    }
    
    func fetchRefresh() async throws -> RefreshResponse {
        guard let refreshToken = try keychain.get(KeychainKey.refreshToken.rawValue) else {
            throw AuthError.noRefreshToken
        }
        
        let dto: RefreshResponse = try await networkService.request(AuthEndpoint.refresh(refreshToken: refreshToken, deviceID: self.deviceID, deviceName: self.deviceName))
        
        try keychain.set(dto.accessToken, key: KeychainKey.accessToken.rawValue)
        try keychain.set(dto.refreshToken, key: KeychainKey.refreshToken.rawValue)
        
        return dto
    }
    
    func autoLogin() async throws -> User {
        let dto: RefreshResponse = try await fetchRefresh()
        let accessToken = dto.accessToken
        print(dto.refreshToken)
        print("deviceID: \(deviceID)")
        print("deviceName: \(deviceName)")
        let user = try await userRepository.fetchUser(accessToken: accessToken)
        return user
    }
    
    func fetchLogout() async throws -> String {
        guard let refreshToken = try keychain.get(KeychainKey.refreshToken.rawValue) else {
            throw AuthError.noRefreshToken
        }
        
        let dto: LogoutResponse = try await networkService.request(AuthEndpoint.logout(refreshToken: refreshToken, deviceID: self.deviceID, deviceName: self.deviceName))
        
        return dto.message
    }
    
    func fetchLoginRequestCode(email: String) async throws -> String {
        let dto: LoginCodeResponse
        do {
            dto = try await networkService.request(AuthEndpoint.loginRequestCode(email: email))
        } catch NetworkError.serverError(let statusCode, let data) where statusCode == 404 {
            throw AuthError.noAccount
        }
        
        return dto.message
    }
    
    func fetchLoginConfirm(email: String, code: String) async throws -> User {
        let dto: LoginConfirmResponse
        do {
            dto = try await networkService.request(AuthEndpoint.loginConfirm(email: email, code: code, deviceID: self.deviceID, deviceName: self.deviceName))
        } catch {
            throw AuthError.noCode
        }
        
        try keychain.set(dto.accessToken, key: KeychainKey.accessToken.rawValue)
        try keychain.set(dto.refreshToken, key: KeychainKey.refreshToken.rawValue)
        
        return dto.user.toDomain()
    }
    
    func fetchRegisterRequestCode(email: String) async throws -> String {
        let dto: RegisterCodeResponse
        do {
            dto = try await networkService.request(AuthEndpoint.registerRequestCode(email: email))
            return dto.message
            
        } catch NetworkError.serverError(let statusCode, let data) {
            if statusCode == 400,
               let data,
               let _ = try? JSONDecoder().decode(RegisterCodeErrorResponse.self, from: data) {
                throw AuthError.accountAlreadyExists
            }
            
            throw AuthError.unknown
        }
    }
}
