//
//  AnimeWeebApp.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

@main
struct AnimeWeebApp: App {

    @State private var coordinator: Coordinator = Coordinator()
    @State private var appViewModel: AppViewModel
    private let googleService: GoogleService = GoogleService()
    
    init() {
        let coordinator = Coordinator()
        _coordinator = State(wrappedValue: coordinator)
        _appViewModel = State(wrappedValue: coordinator.factory.makeAppViewModel())
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                coordinator.resolve(screen: .home)
                    .navigationDestination(for: Screen.self) { screen in
                        coordinator.resolve(screen: screen)
                    }
            }
            .safeAreaInset(edge: .top) {
                coordinator.factory.makeAppHeader(coordinator: coordinator)
            }
            .task {
                await appViewModel.bootstrapApp()
            }
            .onOpenURL { url in
                _ = googleService.handleOpenURL(url)
            }
        }
    }
}
