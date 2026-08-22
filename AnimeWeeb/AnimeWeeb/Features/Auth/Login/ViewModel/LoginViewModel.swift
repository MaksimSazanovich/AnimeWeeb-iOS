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
    
    private let authService: GoogleService
    private let userService: UserService
    
    var onRoute: (() -> Void)?
    
    init(authService: GoogleService, userService: UserService) {
        self.authService = authService
        self.userService = userService
    }
    
    func loginWithGoogle() async {
        do {
            let authResult = try await authService.getGoogleIDToken()
            print(authResult)
            
            //let user = User(id: <#T##Int#>, email: <#T##String#>, name: <#T##String#>, level: <#T##Int#>)
        } catch {
            
        }
    }

    func didTapGetCodeButton() {
        // TODO: GetCode logic
        print("Get code")
    }

    func didTapSwitchAuthButton() {
        onRoute?()
    }

}
