//
//  AppContainer.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import KeychainAccess
import Observation

@Observable
final class AppContainer {
    // Services
    let networkService: NetworkServiceProtocol
    let userService: UserService
    let googleService: GoogleService
    let appURLOpener: AppURLOpener
    let keychain: Keychain

    // Repositories
    let userRepository: UserRepositoryProtocol
    let homeRepository: HomeRepositoryProtocol
    let watchRepository: WatchRepositoryProtocol
    let animeDetailsRepository: AnimeDetailsRepositoryProtocol
    let authRepository: AuthRepositoryProtocol
    let userListsRepository: UserListsRepositoryProtocol

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
        authRepository: AuthRepositoryProtocol? = nil,
        userListsRepository: UserListsRepositoryProtocol? = nil
    ) {
        self.networkService = networkService
        self.userService = userService
        self.googleService = googleService
        self.appURLOpener = appURLOpener
        self.keychain = Keychain(service: "MS.AnimeWeeb").accessibility(.whenUnlocked)

        let userRepo = userRepository ?? UserRepository(networkService: networkService, keychain: keychain)
        let homeRepo = homeRepository ?? HomeRepository(networkService: networkService)
        let watchRepo = watchRepository ?? WatchRepository(networkService: networkService)
        let animeRepo = animeDetailsRepository ?? AnimeDetailsRepository(networkService: networkService)
        let authRepo = authRepository ?? AuthRepository(
            networkService: networkService,
            googleService: googleService,
            userRepository: userRepo,
            keychain: keychain
        )
        let userListsRepo = userListsRepository ?? UserListsRepository(
            networkService: networkService,
            keychain: keychain
        )

        self.userRepository = userRepo
        self.homeRepository = homeRepo
        self.watchRepository = watchRepo
        self.animeDetailsRepository = animeRepo
        self.authRepository = authRepo
        self.userListsRepository = userListsRepo

        let factory = ScreenFactory(
            homeRepository: homeRepo,
            watchRepository: watchRepo,
            animeDetailsRepository: animeRepo,
            userRepository: userRepo,
            authRepository: authRepo,
            userListsRepository: userListsRepo,

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
