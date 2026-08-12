//
//  AnimeWeebApp.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

@main
struct AnimeWeebApp: App {
    
    @State private var coordinator = Coordinator()
    @Namespace private var animeNamespace
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                coordinator.makeHomeScreen(namespace: animeNamespace)
                    .navigationDestination(for: Screen.self) { screen in
                        coordinator.resolve(screen: screen, namespace: animeNamespace)
                    }
            }
            .safeAreaInset(edge: .top) {
                AppHeaderView(viewModel: coordinator.headerViewModel)
                
            }
        }
    }
}
