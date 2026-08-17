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

    var onRoute: ((Screen) -> Void)?

    var isMenuOpen = false
    var isAuthorized = false

    // TODO: User Service
    var user: User?

    init(urlOpener: AppURLOpener, isMenuOpen: Bool = false, isAuthorized: Bool = false, user: User? = nil) {
        self.urlOpener = urlOpener
        self.isMenuOpen = isMenuOpen
        self.isAuthorized = isAuthorized
        self.user = user
    }

    func didTapMenu() {
        isMenuOpen.toggle()
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
