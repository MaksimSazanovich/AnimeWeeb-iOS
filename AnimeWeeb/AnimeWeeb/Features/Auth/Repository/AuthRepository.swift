//
//  AuthRepository.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation
import UIKit
import KeychainAccess

final class AuthRepository: AuthRepositoryProtocol {
    private let networkService: NetworkServiceProtocol
    private let googleService: GoogleService
    private let userRepository: UserRepositoryProtocol
    
    private let keychain = Keychain(service: "MS.AnimeWeeb")
            .accessibility(.whenUnlocked)

    public init(networkService: NetworkServiceProtocol, googleService: GoogleService, userRepository: UserRepositoryProtocol) {
        self.networkService = networkService
        self.googleService = googleService
        self.userRepository = userRepository
    }
    
    func fetchUserWithGoogle() async throws -> User {
        let idToken = try await googleService.getGoogleIDToken()
        
        let dto: AuthResponseDTO = try await networkService.request(AuthEndpoint.google(idToken: idToken, deviceID: UIDevice.deviceID, deviceName: UIDevice.deviceName))
        
        try keychain.set(dto.accessToken, key: KeychainKey.accessToken.rawValue)
        try keychain.set(dto.refreshToken, key: KeychainKey.refreshToken.rawValue)
        
        print("\(dto.accessToken)\n")
        print(dto.refreshToken)
        print("deviceID: \(UIDevice.deviceID)")
        print("deviceName: \(UIDevice.deviceName)")
        
        return dto.user.toDomain()
    }
    
    func fetchUserWithGoogle(idToken: String) async throws -> User {
        let dto: AuthResponseDTO = try await networkService.request(AuthEndpoint.google(idToken: idToken, deviceID: UIDevice.deviceID, deviceName: UIDevice.deviceName))
        
        try keychain.set(dto.accessToken, key: KeychainKey.accessToken.rawValue)
        try keychain.set(dto.refreshToken, key: KeychainKey.refreshToken.rawValue)
        
        print("\(dto.accessToken)\n")
        print(dto.refreshToken)
        print("deviceID: \(UIDevice.deviceID)")
        print("deviceName: \(UIDevice.deviceName)")
        
        return dto.user.toDomain()
    }
    
    func fetchRefresh() async throws -> RefreshResponseDTO {
        guard let refreshToken = try keychain.get(KeychainKey.refreshToken.rawValue) else {
            throw AuthError.noRefreshToken
        }
        
        let dto: RefreshResponseDTO = try await networkService.request(AuthEndpoint.refresh(refreshToken: refreshToken, deviceID: UIDevice.deviceID, deviceName: UIDevice.deviceName))
        
        try keychain.set(dto.accessToken, key: KeychainKey.accessToken.rawValue)
        try keychain.set(dto.refreshToken, key: KeychainKey.refreshToken.rawValue)
        
        return dto
    }
    
    func autoLogin() async throws -> User {
        let accessToken = try await fetchRefresh().accessToken
        print(accessToken)
        let user = try await userRepository.fetchUser(accessToken: accessToken)
        print(user.email)
        return user
    }
}


