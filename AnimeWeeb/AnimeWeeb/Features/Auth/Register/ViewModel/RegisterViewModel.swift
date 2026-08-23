//
//  RegisterViewModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

@MainActor
@Observable
final class RegisterViewModel: AuthViewModelProtocol {
    var onRoute: ((Screen) -> Void)?

    func didTapGetCodeButton() {
        // TODO: GetCode logic
        print("Get code")
    }

    func didTapSwitchAuthButton() {
        onRoute?(Screen.login)
    }

}
