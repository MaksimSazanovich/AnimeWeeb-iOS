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
    
    var code: String = ""
    var onRoute: ((Screen) -> Void)?
    
    func didTapCahngeEmail() {
        onRoute?(Screen.login)
    }
    
    func didTapSwitchAuthButton() {
        onRoute?(Screen.register)
    }
}
