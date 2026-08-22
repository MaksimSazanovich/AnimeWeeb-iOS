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
    private let googleService: GoogleService = GoogleService()

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
                await googleService.restorePreviousSignIn()
            }
            .onOpenURL { url in
                _ = googleService.handleOpenURL(url)
            }
        }
    }
}
