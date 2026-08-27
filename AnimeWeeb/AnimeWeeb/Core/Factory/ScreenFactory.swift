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
            coordinator?.navigate(to: destination)
        }

        return AppHeaderView(viewModel: viewModel)
    }

    func makeHomeScreen(coordinator: Coordinator) -> some View {

        let viewModel = HomeViewModel(repository: self.homeRepository)
        viewModel.onRoute = { [weak coordinator] destination in
            coordinator?.navigate(to: destination)
        }

        return HomeScreen(viewModel: viewModel)
    }

    func makeLoginScreen(coordinator: Coordinator) -> some View {
        let viewModel = LoginViewModel(authRepository: authRepository, userService: userService)
        viewModel.onRoute = { [weak coordinator] destination in
            coordinator?.navigate(to: destination)
        }

        return LoginScreen(viewModel: viewModel)
    }

    func makeRegisterScreen(coordinator: Coordinator) -> some View {
        let viewModel = RegisterViewModel(authRepository: authRepository, userService: userService)
        viewModel.onRoute = { [weak coordinator] destination in
            coordinator?.navigate(to: destination)
        }

        return RegisterScreen(viewModel: viewModel)
    }

    func makeLoginConfirmScreen(email: String, coordinator: Coordinator) -> some View {
        let viewModel = LoginConfirmViewModel(
            email: email,
            authRepository: authRepository,
            userService: userService
        )
        viewModel.onRoute = { [weak coordinator] destination in
            coordinator?.navigate(to: destination)
        }

        return LoginConfirmScreen(viewModel: viewModel)
    }
    
    func makeRegisterConfirmScreen(email: String, coordinator: Coordinator) -> some View {
        let viewModel = RegisterConfirmViewModel(
            email: email,
            authRepository: authRepository,
            userService: userService
        )
        viewModel.onRoute = { [weak coordinator] destination in
            coordinator?.navigate(to: destination)
        }

        return RegisterConfirmScreen(viewModel: viewModel)
    }

    func makeAnimeDetailsScreen(animeID: Int, coordinator: Coordinator) -> some View {
        let viewModel = AnimeDetailsViewModel(animeID: animeID, repository: animeDetailsRepository)
        viewModel.onRoute = { [weak coordinator] destination in
            coordinator?.navigate(to: destination)
        }
        return AnimeDetailsScreen(viewModel: viewModel)
    }

    func makeWatchScreen(model: WatchModel, coordinator: Coordinator) -> some View {
        let viewModel = WatchViewModel(model: model, repository: watchRepository)
        viewModel.onRoute = { [weak coordinator] destination in
            coordinator?.navigate(to: destination)
        }

        return WatchScreen(viewModel: viewModel)
    }

    func makeProfileScreen(coordinator: Coordinator) -> some View {
        let viewModel = ProfileViewModel(userService: userService, authRepository: authRepository)
        viewModel.onRoute = { [weak coordinator] destination in
            coordinator?.navigate(to: destination)
        }
        return ProfileScreen(viewModel: viewModel)
    }

    func makeAppViewModel() -> AppViewModel {
        AppViewModel(authRepository: authRepository, userService: userService, googleService: googleService)
    }
}
