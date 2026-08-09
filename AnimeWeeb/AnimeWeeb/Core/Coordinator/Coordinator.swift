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
    
    let headerViewModel: AppHeaderViewModel
    
    @ViewBuilder
    func resolve(screen: Screen) -> some View {
        switch screen {
        case .home:
            makeHomeScreen()
        case .login:
            makeLoginScreen()
        case .register:
            makeRegisterScreen()
        case .animeDetails(let anime):
            makeAnimeDetailsScreen(anime: anime)
                
        case .player:
            makePlayerScreen()
        case .profile:
            makeProfileScreen()
        }
    }
    
    init() {
        let appURLOpener = AppURLOpener()
        self.headerViewModel = AppHeaderViewModel(urlOpener: appURLOpener)
        
        headerViewModel.onRoute = { [weak self] destination in
            switch destination {
            case .home:
                self?.openHome()
            case .login:
                self?.openLogin()
            case .profile:
                self?.openProfile()
            case .player, .register, .animeDetails:
                break
            }
        }
    }
    
    func makeHomeScreen() -> some View {
        //TODO: REAL API DATA
        let viewModel = HomeViewModel(newRealeses: previewNewReleasesAnimeModels, animes: previewAnimeModels)
        viewModel.onRoute = { [weak self] anime in
            self?.openAnimeDetails(anime: anime)
        }
        
        return HomeScreen(viewModel: viewModel)
    }
    
    func makeLoginScreen() -> some View {
        let viewModel = LoginViewModel()
        viewModel.onRoute = { [weak self] in
            self?.openRegister()
        }
        
        return LoginScreen(viewModel: viewModel)
    }
    
    func makeRegisterScreen() -> some View {
        let viewModel = RegisterViewModel()
        viewModel.onRoute = { [weak self] in
            self?.openLogin()
        }
        
        return RegisterScreen(viewModel: viewModel)
    }
    
    func makeAnimeDetailsScreen(anime: AnimeModel) -> some View {
        let viewModel = AnimeDetailsViewModel(anime: anime)
        return AnimeDetailsScreen(viewModel: viewModel)
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
    
    func openAnimeDetails(anime: AnimeModel) {
        path.append(Screen.animeDetails(anime: anime))
    }
    
    func openPlayer() {
        path.append(Screen.player)
    }
    
    func openProfile() {
        path.append(Screen.profile)
    }
}
