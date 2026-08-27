//
//  RegisterConfirmViewModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation
import GoogleSignIn

@MainActor
@Observable
final class RegisterConfirmViewModel {
    
    private var model: RegisterConfirmModel {
        didSet {
            if model.isFormComplete {
                state = .idle
            } else {
                state = .empty
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
    
    var nickname: String {
        get {
            model.nickname
        }
        set {
            model.nickname = newValue
        }
    }

    var state: ViewState = .empty

    var onRoute: ((Screen) -> Void)?

    init(email: String, authRepository: AuthRepositoryProtocol, userService: UserService) {
        self.model = RegisterConfirmModel(email: email)
        self.authRepository = authRepository
        self.userService = userService
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

    func updateAvatar(avatar: Data) {
        model.avatar = avatar
    }
    
    private func clearCode() {
        code = ""
    }
}
