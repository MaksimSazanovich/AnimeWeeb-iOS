//
//  AppViewModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

@MainActor
@Observable
final class AppViewModel {
    private let authRepository: AuthRepositoryProtocol
    private let userService: UserService
    private let googleService: GoogleService

    init(authRepository: AuthRepositoryProtocol, userService: UserService, googleService: GoogleService) {
        self.authRepository = authRepository
        self.userService = userService
        self.googleService = googleService
    }

    func bootstrapApp() async {
        do {
            let user = try await authRepository.autoLogin()
            userService.update(user: user)
        } catch {
            do {
                let idToken = try await googleService.restorePreviousSignIn()
                let user = try await authRepository.fetchUserWithGoogle(idToken: idToken)
                userService.update(user: user)
            } catch {
                userService.logout()
            }
        }
    }
}
