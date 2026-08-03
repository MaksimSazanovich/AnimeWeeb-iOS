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
            HomeScreen(animes: previewNewReleasesAnimeModels)
        }
    }
}
