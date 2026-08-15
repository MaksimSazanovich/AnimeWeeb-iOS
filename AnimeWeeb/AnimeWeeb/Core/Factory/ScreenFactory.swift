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
    private let animeDetailsRepository: AnimeDetailsRepositoryProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService(),
         homeRepository: HomeRepositoryProtocol? = nil,
         watchRepository: WatchRepositoryProtocol? = nil,
         animeDetailsRepository: AnimeDetailsRepositoryProtocol? = nil) {
        self.networkService = networkService
        self.homeRepository = homeRepository ?? HomeRepository(networkService: networkService)
        self.watchRepository = watchRepository ?? WatchRepository(networkService: networkService)
        self.animeDetailsRepository = animeDetailsRepository ?? AnimeDetailsRepository(networkService: networkService)
    }
    
    func makeHomeScreen(coordinator: Coordinator) -> some View {
        
        let viewModel = HomeViewModel(repository: self.homeRepository)
        viewModel.onRouteToDetails = { [weak coordinator] animeID in
            coordinator?.openAnimeDetails(animeID: animeID)
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
    
    func makeAnimeDetailsScreen(animeID: Int) -> some View {
        let viewModel = AnimeDetailsViewModel(animeID: animeID, repository: animeDetailsRepository)
        return AnimeDetailsScreen(viewModel: viewModel)
    }
    
    func makeWatchScreen(model: WatchModel, coordinator: Coordinator) -> some View {
        let viewModel = WatchViewModel(model: model, repository: watchRepository)
        viewModel.onRoute = { [weak coordinator] screen in
            switch screen {
            case .home:
                coordinator?.openHome()
            case .animeDetails(animeID: let id):
                coordinator?.openAnimeDetails(animeID: id)
            default :
                break
            }
        }
        
        return WatchScreen(viewModel: viewModel)
    }
    
    func makeProfileScreen() -> some View {
        return ProfileScreen()
    }
}
