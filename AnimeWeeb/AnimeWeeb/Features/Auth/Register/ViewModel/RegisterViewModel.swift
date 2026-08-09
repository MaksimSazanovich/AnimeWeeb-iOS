//
//  RegisterViewModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

final class RegisterViewModel: AuthViewModelProtocol {
    var onRoute: (() -> Void)?
    
    func didTapGetCodeButton() {
        // TODO: GetCode logic
        print("Get code")
    }
    
    func didTapSwitchAuthButton() {
        onRoute?()
    }
    
    
}
