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
    private let keychain = Keychain(service: "MS.AnimeWeeb")
            .accessibility(.whenUnlocked)

    public init(networkService: NetworkServiceProtocol, googleService: GoogleService) {
        self.networkService = networkService
        self.googleService = googleService
    }
    
    func fetchUserWithGoogle() async throws -> User {
        let idToken = try await googleService.getGoogleIDToken()
        
        let dto: AuthResponseDTO = try await networkService.request(AuthEndpoint.google(idToken: idToken, deviceID: UIDevice.deviceID, deviceName: UIDevice.deviceName))
        
        try keychain.set(dto.accessToken, key: KeychainKey.accessToken.rawValue)
        try keychain.set(dto.refreshToken, key: KeychainKey.refreshToken.rawValue)
        
        return dto.user.toDomain()
    }
}


