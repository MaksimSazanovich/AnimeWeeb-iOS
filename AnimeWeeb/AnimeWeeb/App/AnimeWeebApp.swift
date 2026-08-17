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

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                coordinator.resolve(screen: .home)
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
