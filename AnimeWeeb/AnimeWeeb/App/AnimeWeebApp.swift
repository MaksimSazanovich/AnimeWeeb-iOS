//
//  AnimeWeebApp.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

@main
struct AnimeWeebApp: App {
    
    private let homeRepository = HomeRepository()
    @State private var coordinator = Coordinator(homeRepository: HomeRepository())
    
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
