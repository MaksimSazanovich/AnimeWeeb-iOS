//
//  LoginConfirmViewModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

@MainActor
@Observable
final class LoginConfirmViewModel {

    private var model: LoginConfirmModel {
        didSet {
            if model.isCodeComplete {
                didTapVerifyButton()
            }
        }
    }

    private let authRepository: AuthRepositoryProtocol
    private let userService: UserService

    var email: String {
        return model.email
    }

    var code: String {
        get {
            model.code
        }
        set {
            model.code = newValue
        }
    }

    var codeLength: Int {
        return model.codeLength
    }

    var state: ViewState = .idle

    var onRoute: ((Screen) -> Void)?

    init(email: String, authRepository: AuthRepositoryProtocol, userService: UserService) {
        self.model = LoginConfirmModel(email: email)
        self.authRepository = authRepository
        self.userService = userService
    }

    func didTapChangeEmail() {
        onRoute?(Screen.login)
    }

    func didTapSwitchAuthButton() {
        onRoute?(Screen.register)
    }

    func didTapVerifyButton() {
        Task {
            do {
                state = .loading
                let user: User = try await authRepository.fetchLoginConfirm(email: email, code: code)
                state = .loaded
                userService.update(user: user)
                onRoute?(Screen.home)
            } catch {
                clearCode()
                state = .failed(error)
            }
        }
    }

    private func clearCode() {
        code = ""
    }
}
