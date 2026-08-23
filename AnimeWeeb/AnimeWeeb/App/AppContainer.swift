//
//  AppContainer.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Observation

@Observable
final class AppContainer {
    // Services
    let networkService: NetworkServiceProtocol
    let userService: UserService
    let googleService: GoogleService
    let appURLOpener: AppURLOpener

    // Repositories
    let userRepository: UserRepositoryProtocol
    let homeRepository: HomeRepositoryProtocol
    let watchRepository: WatchRepositoryProtocol
    let animeDetailsRepository: AnimeDetailsRepositoryProtocol
    let authRepository: AuthRepositoryProtocol

    // Core Architecture
    let screenFactory: ScreenFactory
    var coordinator: Coordinator
    let appViewModel: AppViewModel

    init(
        networkService: NetworkServiceProtocol = NetworkService(),
        userService: UserService = UserService(),
        googleService: GoogleService = GoogleService(),
        appURLOpener: AppURLOpener = AppURLOpener(),
        
        homeRepository: HomeRepositoryProtocol? = nil,
        watchRepository: WatchRepositoryProtocol? = nil,
        animeDetailsRepository: AnimeDetailsRepositoryProtocol? = nil,
        userRepository: UserRepositoryProtocol? = nil,
        authRepository: AuthRepositoryProtocol? = nil
    ) {
        self.networkService = networkService
        self.userService = userService
        self.googleService = googleService
        self.appURLOpener = appURLOpener

        let userRepo = userRepository ?? UserRepository(networkService: networkService)
        let homeRepo = homeRepository ?? HomeRepository(networkService: networkService)
        let watchRepo = watchRepository ?? WatchRepository(networkService: networkService)
        let animeRepo = animeDetailsRepository ?? AnimeDetailsRepository(networkService: networkService)
        let authRepo = authRepository ?? AuthRepository(
            networkService: networkService,
            googleService: googleService,
            userRepository: userRepo
        )

        self.userRepository = userRepo
        self.homeRepository = homeRepo
        self.watchRepository = watchRepo
        self.animeDetailsRepository = animeRepo
        self.authRepository = authRepo

        let factory = ScreenFactory(
            homeRepository: homeRepo,
            watchRepository: watchRepo,
            animeDetailsRepository: animeRepo,
            userRepository: userRepo,
            authRepository: authRepo,
            
            networkService: networkService,
            appURLOpener: appURLOpener,
            userService: userService,
            googleService: googleService
        )
        self.screenFactory = factory

        self.coordinator = Coordinator(factory: factory)
        self.appViewModel = AppViewModel(
            authRepository: authRepo,
            userService: userService,
            googleService: googleService
        )
    }
}
