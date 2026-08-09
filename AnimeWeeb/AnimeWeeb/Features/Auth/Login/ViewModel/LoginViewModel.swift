//
//  LoginViewModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

@Observable
final class LoginViewModel: AuthViewModelProtocol {
    var onRoute: (() -> Void)?
    
    func didTapGetCodeButton() {
        // TODO: GetCode logic
        print("Get code")
    }
    
    func didTapSwitchAuthButton() {
        onRoute?()
    }
    
    
}
