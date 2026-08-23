//
//  AnimeWeebApp.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

@main
struct AnimeWeebApp: App {

    @State private var container = AppContainer()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $container.coordinator.path) {
                container.coordinator.resolve(screen: .home)
                    .navigationDestination(for: Screen.self) { screen in
                        container.coordinator.resolve(screen: screen)
                    }
            }
            .safeAreaInset(edge: .top) {
                container.screenFactory.makeAppHeader(coordinator: container.coordinator)
            }
            .task {
                await container.appViewModel.bootstrapApp()
            }
            .onOpenURL { url in
                _ = container.googleService.handleOpenURL(url)
            }
        }
    }
}
