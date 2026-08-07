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
    
    @ViewBuilder
    func resolve(screen: Screen) -> some View {
        switch screen {
        case .home:
            makeHomeScreen()
        case .login:
            makeLoginScreen()
        case .register:
            makeRegisterScreen()
        case .animeDetails:
            makeAnimeDetailsScreen()
        case .player:
            makePlayerScreen()
        case .profile:
            makeProfileScreen()
        }
    }
    
    func makeHomeScreen() -> some View {
        let appURLOpener = AppURLOpener()
        let viewModel = AppHeaderViewModel(urlOpener: appURLOpener)
        
        viewModel.onRoute = { [weak self] destination in
            switch destination {
            case .home:
                self?.openHome()
            case .login:
                self?.openLogin()
            case .animeDetails:
                self?.openAnimeDetails()
            case .profile:
                self?.openProfile()
            case .player, .register:
                break
            }
        }
        
        return HomeScreen(newRealeses: previewNewReleasesAnimeModels, appHeaderViewModel: viewModel)
    }
    
    func makeLoginScreen() -> some View {
        return LoginScreen()
    }
    
    func makeRegisterScreen() -> some View {
        return RegisterScreen()
    }
    
    func makeAnimeDetailsScreen() -> some View {
        return AnimeDetailsScreen()
    }
    
    func makePlayerScreen() -> some View {
        return PlayerScreen()
    }
    
    func makeProfileScreen() -> some View {
        return ProfileScreen()
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
    
    func openAnimeDetails() {
        path.append(Screen.animeDetails)
    }
    
    func openPlayer() {
        path.append(Screen.player)
    }
    
    func openProfile() {
        path.append(Screen.profile)
    }
}
