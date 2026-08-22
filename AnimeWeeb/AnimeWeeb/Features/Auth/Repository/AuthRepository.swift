//
//  AuthRepository.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation
import UIKit

final class AuthRepository {
    private let networkService: NetworkServiceProtocol
    private let googleService: GoogleService
    private let userService: UserService

    public init(networkService: NetworkServiceProtocol, googleService: GoogleService, userService: UserService) {
        self.networkService = networkService
        self.googleService = googleService
        self.userService = userService
    }
    
    func fetchGoogle() async throws -> AuthResponseDTO {
        let idToken = try await googleService.getGoogleIDToken()
        
        let dto: AuthResponseDTO = try await networkService.request(AuthEndpoint.google(idToken: idToken, deviceID: UIDevice.deviceID, deviceName: UIDevice.deviceName))
        
        return dto
    }
}
