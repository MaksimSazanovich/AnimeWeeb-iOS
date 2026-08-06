//
//  AnimeWeebApp.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

@main
struct AnimeWeebApp: App {
    
    var body: some Scene {
        WindowGroup {
            makeHomeScreen()
        }
    }
    
    func makeHomeScreen() -> some View {
        let appURLOpener = AppURLOpener()
        let appHeaderViewModel = AppHeaderViewModel(urlOpener: appURLOpener)
        
        return HomeScreen(newRealeses: previewNewReleasesAnimeModels, appHeaderViewModel: appHeaderViewModel)
    }
}
