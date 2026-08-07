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
    
    var body: some Scene {
        WindowGroup {
            VStack(spacing: 0){
                
                AppHeaderView(viewModel: coordinator.headerViewModel)
                
                NavigationStack(path: $coordinator.path) {
                    coordinator.makeHomeScreen()
                        .navigationDestination(for: Screen.self) { screen in
                            coordinator.resolve(screen: screen)
                        }
                }
            }
        }
    }
    
    
}
