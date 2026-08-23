//
//  ScreenFactory.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

final class ScreenFactory {
    
    private let homeRepository: HomeRepositoryProtocol
    private let watchRepository: WatchRepositoryProtocol
    private let animeDetailsRepository: AnimeDetailsRepositoryProtocol
    private let userRepository: UserRepositoryProtocol
    private let authRepository: AuthRepositoryProtocol

    private let networkService: NetworkServiceProtocol
    private let appURLOpener: AppURLOpener
    private let userService: UserService
    private let googleService: GoogleService

    init(homeRepository: HomeRepositoryProtocol,
         watchRepository: WatchRepositoryProtocol,
         animeDetailsRepository: AnimeDetailsRepositoryProtocol,
         userRepository: UserRepositoryProtocol,
         authRepository: AuthRepositoryProtocol,
         
         networkService: NetworkServiceProtocol,
         appURLOpener: AppURLOpener,
         userService: UserService,
         googleService: GoogleService) {
        self.homeRepository = homeRepository
        self.watchRepository = watchRepository
        self.animeDetailsRepository = animeDetailsRepository
        self.userRepository = userRepository
        self.authRepository = authRepository
        
        self.networkService = networkService
        self.appURLOpener = appURLOpener
        self.userService = userService
        self.googleService = googleService
    }

    func makeAppHeader(coordinator: Coordinator) -> some View {
        let viewModel = AppHeaderViewModel(urlOpener: appURLOpener, userService: userService)

        viewModel.onRoute = { [weak coordinator] destination in
            switch destination {
            case .home:
                coordinator?.openHome()
            case .login:
                coordinator?.openLogin()
            case .profile:
                coordinator?.openProfile()
            case .watch, .register, .animeDetails:
                break
            }
        }

        return AppHeaderView(viewModel: viewModel)
    }

    func makeHomeScreen(coordinator: Coordinator) -> some View {

        let viewModel = HomeViewModel(repository: self.homeRepository)
        
        viewModel.onRoute = { [weak coordinator] destination in
            switch destination {
            case .animeDetails(let animeID):
                coordinator?.openAnimeDetails(animeID: animeID)
            case .watch(model: let watchModel):
                coordinator?.openWatch(watchModel: watchModel)
            default:
                break
            }
        }

        return HomeScreen(viewModel: viewModel)
    }

    func makeLoginScreen(coordinator: Coordinator) -> some View {
        let viewModel = LoginViewModel(authRepository: authRepository, userService: userService)
        viewModel.onRoute = { [weak coordinator] destination in
            switch destination {
            case .home:
                coordinator?.openHome()
            case .register:
                coordinator?.openRegister()
            default:
                break
            }
        }

        return LoginScreen(viewModel: viewModel)
    }

    func makeRegisterScreen(coordinator: Coordinator) -> some View {
        let viewModel = RegisterViewModel()
        viewModel.onRoute = { [weak coordinator] destination in
            switch destination {
            case .home:
                coordinator?.openHome()
            case .login:
                coordinator?.openLogin()
            default:
                break
            }
        }

        return RegisterScreen(viewModel: viewModel)
    }

    func makeAnimeDetailsScreen(animeID: Int, coordinator: Coordinator) -> some View {
        let viewModel = AnimeDetailsViewModel(animeID: animeID, repository: animeDetailsRepository)
        viewModel.onRoute = { [weak coordinator] destination in
            switch destination {
            case .home:
                coordinator?.openHome()
            default:
                break
            }
        }
        return AnimeDetailsScreen(viewModel: viewModel)
    }

    func makeWatchScreen(model: WatchModel, coordinator: Coordinator) -> some View {
        let viewModel = WatchViewModel(model: model, repository: watchRepository)
        viewModel.onRoute = { [weak coordinator] destination in
            switch destination {
            case .home:
                coordinator?.openHome()
            case .animeDetails(animeID: let id):
                coordinator?.openAnimeDetails(animeID: id)
            default:
                break
            }
        }

        return WatchScreen(viewModel: viewModel)
    }

    func makeProfileScreen(coordinator: Coordinator) -> some View {
        let viewModel = ProfileViewModel(userService: userService, authRepository: authRepository)
        viewModel.onRoute = { [weak coordinator] destination in
            switch destination {
            case .home:
                coordinator?.openHome()
            default:
                break
            }
        }
        return ProfileScreen(viewModel: viewModel)
    }
    
    func makeAppViewModel() -> AppViewModel {
        AppViewModel(authRepository: authRepository, userService: userService, googleService: googleService)
    }
}
