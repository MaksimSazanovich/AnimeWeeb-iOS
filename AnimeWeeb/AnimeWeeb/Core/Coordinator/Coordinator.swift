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
    
    private let networkService: NetworkServiceProtocol
    
    private let homeRepository: HomeRepositoryProtocol
    private let watchRepository: WatchRepositoryProtocol
    
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
                
        case .watch(let model):
            makeWatchScreen(model: model)
        case .profile:
            makeProfileScreen()
        }
    }
    
    init() {
        let appURLOpener = AppURLOpener()
        self.headerViewModel = AppHeaderViewModel(urlOpener: appURLOpener)
        
        self.networkService = NetworkService()
        self.homeRepository = HomeRepository(networkService: networkService)
        self.watchRepository = WatchRepository(networkService: networkService)
        
        headerViewModel.onRoute = { [weak self] destination in
            switch destination {
            case .home:
                self?.openHome()
            case .login:
                self?.openLogin()
            case .profile:
                self?.openProfile()
            case .watch, .register, .animeDetails:
                break
            }
        }
    }
    
    func makeHomeScreen() -> some View {
        
        let viewModel = HomeViewModel(repository: self.homeRepository)
        viewModel.onRouteToDetails = { [weak self] anime in
            self?.openAnimeDetails(anime: anime)
        }
        
        viewModel.onRouteToEpisode = { [weak self] watchModel in
            self?.openWatch(watchModel: watchModel)
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
    
    func makeWatchScreen(model: WatchModel) -> some View {
        let viewModel = WatchViewModel(model: model, repository: watchRepository)
        return WatchScreen(viewModel: viewModel)
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
    
    func openWatch(watchModel: WatchModel) {
        path.append(Screen.watch(model: watchModel))
    }
    
    func openProfile() {
        path.append(Screen.profile)
    }
}
