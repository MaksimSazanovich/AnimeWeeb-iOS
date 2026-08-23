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
    
    var email: String = ""
    var state: ViewState = .idle
    
    var onRoute: ((Screen) -> Void)?
    
    init(authRepository: AuthRepositoryProtocol, userService: UserService) {
        self.authRepository = authRepository
        self.userService = userService
    }
    
    func didTapLoginWithGoogle() {
        Task {
            do {
                let user = try await authRepository.fetchUserWithGoogle()
                userService.update(user: user)
                state = .loaded
                onRoute?(Screen.home)
            } catch is CancellationError {
                state = .idle
            } catch {
                state = .failed(error)
            }
        }
    }

    func didTapGetCodeButton()  {
        Task {
            do {
                state = .loading
                _ = try await authRepository.fetchLoginRequestCode(email: email)
                state = .loaded
            } catch is CancellationError {
                state = .idle
            } catch {
                state = .failed(error)
            }
        }
    }

    func didTapSwitchAuthButton() {
        onRoute?(Screen.register)
    }
}
