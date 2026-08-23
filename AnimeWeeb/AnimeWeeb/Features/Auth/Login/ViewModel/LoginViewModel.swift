//
//  LoginViewModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

@MainActor
@Observable
final class LoginViewModel: AuthViewModelProtocol {
    
    private let authRepository: AuthRepositoryProtocol
    private let userService: UserService
    
    var onRoute: ((Screen) -> Void)?
    
    init(authRepository: AuthRepositoryProtocol, userService: UserService) {
        self.authRepository = authRepository
        self.userService = userService
    }
    
    func didTapLoginWithGoogle() async {
        do {
            let user = try await authRepository.fetchUserWithGoogle()
            userService.update(user: user)
            onRoute?(Screen.home)
        } catch {
            
        }
    }

    func didTapGetCodeButton() {
        // TODO: GetCode logic
        print("Get code")
    }

    func didTapSwitchAuthButton() {
        onRoute?(Screen.register)
    }

}
