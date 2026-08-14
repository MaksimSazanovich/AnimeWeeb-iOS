//
//  ScreenFactory.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

final class ScreenFactory {
    private let networkService: NetworkServiceProtocol
    
    private let homeRepository: HomeRepositoryProtocol
    private let watchRepository: WatchRepositoryProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService(),
         homeRepository: HomeRepositoryProtocol? = nil,
         watchRepository: WatchRepositoryProtocol? = nil) {
        self.networkService = networkService
        self.homeRepository = homeRepository ?? HomeRepository(networkService: networkService)
        self.watchRepository = watchRepository ?? WatchRepository(networkService: networkService)
    }
    
    func makeHomeScreen(coordinator: Coordinator) -> some View {
        
        let viewModel = HomeViewModel(repository: self.homeRepository)
        viewModel.onRouteToDetails = { [weak coordinator] anime in
            coordinator?.openAnimeDetails(anime: anime)
        }
        
        viewModel.onRouteToEpisode = { [weak coordinator] watchModel in
            coordinator?.openWatch(watchModel: watchModel)
        }
        
        return HomeScreen(viewModel: viewModel)
    }
    
    func makeLoginScreen(coordinator: Coordinator) -> some View {
        let viewModel = LoginViewModel()
        viewModel.onRoute = { [weak coordinator] in
            coordinator?.openRegister()
        }
        
        return LoginScreen(viewModel: viewModel)
    }
    
    func makeRegisterScreen(coordinator: Coordinator) -> some View {
        let viewModel = RegisterViewModel()
        viewModel.onRoute = { [weak coordinator] in
            coordinator?.openLogin()
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
}
