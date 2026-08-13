//
//  AnimeWeebApp.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

@main
struct AnimeWeebApp: App {
    
    private let networkService: NetworkServiceProtocol
    private let homeRepository: HomeRepositoryProtocol
    @State private var coordinator: Coordinator
    
    init() {
        networkService = NetworkService()
        homeRepository = HomeRepository(networkService: networkService)
        
        _coordinator = State(wrappedValue: Coordinator(homeRepository: homeRepository))
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                coordinator.makeHomeScreen()
                    .navigationDestination(for: Screen.self) { screen in
                        coordinator.resolve(screen: screen)
                    }
            }
            .safeAreaInset(edge: .top) {
                AppHeaderView(viewModel: coordinator.headerViewModel)
            }
        }
    }
}
