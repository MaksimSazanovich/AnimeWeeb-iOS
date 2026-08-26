//
//  OTPVerificationViewModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

@MainActor
@Observable
final class OTPVerificationViewModel {
    
    private var model: OTPVerificationModel {
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
    
    init(email: String ,AuthRepository: AuthRepositoryProtocol, userService: UserService) {
        self.model = OTPVerificationModel(email: email)
        self.authRepository = AuthRepository
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
