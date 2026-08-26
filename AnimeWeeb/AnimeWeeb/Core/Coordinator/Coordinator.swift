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

        case .otpVerification(let email):
            factory.makeOTPVerificationScreen(email: email,coordinator: self)

        case .animeDetails(let animeID):
            factory.makeAnimeDetailsScreen(animeID: animeID, coordinator: self)

        case .watch(let model):
            factory.makeWatchScreen(model: model, coordinator: self)

        case .profile:
            factory.makeProfileScreen(coordinator: self)
        }
    }

    func navigate(to screen: Screen) {
        switch screen {
        case .home:
            path = NavigationPath()
        default:
            path.append(screen)
        }
    }

    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
}
