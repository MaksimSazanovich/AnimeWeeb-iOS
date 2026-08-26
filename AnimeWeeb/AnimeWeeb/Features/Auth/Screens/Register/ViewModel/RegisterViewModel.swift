//
//  RegisterViewModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation
import GoogleSignIn

@MainActor
@Observable
final class RegisterViewModel: AuthViewModelProtocol {

    private let authRepository: AuthRepositoryProtocol
    private let userService: UserService

    var email: String = ""

    var isEmailValid: Bool {
        email.emailValidationError == nil
    }

    var state: ViewState = .idle
    var onRoute: ((Screen) -> Void)?

    init(authRepository: AuthRepositoryProtocol, userService: UserService) {
        self.authRepository = authRepository
        self.userService = userService
    }

    func didTapGetCodeButton() {
        if let validationError = email.emailValidationError {
            state = .failed(validationError)
            return
        }

        Task {
            do {
                state = .loading
                _ = try await authRepository.fetchRegisterRequestCode(email: email)
                state = .loaded
                onRoute?(Screen.otpVerification(email: email))
            } catch is CancellationError {
                state = .idle
            } catch {
                state = .failed(error)
            }
        }
    }

    func didTapSwitchAuthButton() {
        onRoute?(Screen.login)
    }

    func didTapLoginWithGoogle() {
        Task {
            do {
                let user = try await authRepository.fetchUserWithGoogle()
                userService.update(user: user)
                state = .loaded
                onRoute?(Screen.home)
            } catch let error as GIDSignInError where error.code == .canceled {
                state = .idle
            } catch {
                state = .failed(error)
            }
        }
    }

}
