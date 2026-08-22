//
//  AppHeaderViewModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation
import Observation

@MainActor
@Observable
public class AppHeaderViewModel {

    private let urlOpener: AppURLOpener
    private let userService: UserService

    var user: User? {
        userService.user
    }

    var authState: AuthState {
        userService.authState
    }

    var onRoute: ((Screen) -> Void)?

    var isMenuOpen = false

    init(urlOpener: AppURLOpener, userService: UserService, isMenuOpen: Bool = false) {
        self.urlOpener = urlOpener
        self.userService = userService
        self.isMenuOpen = isMenuOpen
    }

    func didTapMenu() {
        isMenuOpen.toggle()
        print(userService.authState)
    }

    func didTapHome() {
        isMenuOpen = false
        onRoute?(.home)
    }

    func didTapSocial(socialMedia: SocialMedia) {
        urlOpener.open(socialMedia.url)
    }

    func didTapProfile() {
        isMenuOpen = false
        onRoute?(.profile)
    }

    func didTapLogin() {
        isMenuOpen = false
        onRoute?(.login)
    }
}
