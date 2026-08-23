//
//  Coordinator.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation
import SwiftUI

@Observable
final class Coordinator {
    var path = NavigationPath()

    let factory: ScreenFactory

    init(factory: ScreenFactory) {
        self.factory = factory
    }

    @ViewBuilder
    func resolve(screen: Screen) -> some View {
        switch screen {
        case .home:
            factory.makeHomeScreen(coordinator: self)

        case .login:
            factory.makeLoginScreen(coordinator: self)

        case .register:
            factory.makeRegisterScreen(coordinator: self)

        case .animeDetails(let animeID):
            factory.makeAnimeDetailsScreen(animeID: animeID, coordinator: self)

        case .watch(let model):
            factory.makeWatchScreen(model: model, coordinator: self)

        case .profile:
            factory.makeProfileScreen(coordinator: self)
        }
    }

    func openHome() {
        path = NavigationPath()
    }

    func openLogin() {
        path.append(Screen.login)
    }

    func openRegister() {
        path.append(Screen.register)
    }

    func openAnimeDetails(animeID: Int) {
        path.append(Screen.animeDetails(animeID: animeID))
    }

    func openWatch(watchModel: WatchModel) {
        path.append(Screen.watch(model: watchModel))
    }

    func openProfile() {
        path.append(Screen.profile)
    }
}
