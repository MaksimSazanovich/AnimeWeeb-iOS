//
//  AnimeWeebApp.swift
//  AnimeWeeb
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
