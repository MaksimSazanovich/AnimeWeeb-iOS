//
//  PreviewData.swift
//  AnimeWeeb
//

import Foundation

var previewNewReleasesAnimeModel = NewReleasesAnimeModel(imageURL: URL(string: "https://shikimori.io/uploads/poster/animes/35507/main_alt-528a79ed0d5f22e1c954df240efe63c3.jpeg"), title: "Добро пожаловать в класс превосходства", subtitle: "Добро пожаловать в класс превосходства", season: 4, episode: 13, isTV: true)

var previewNewReleasesAnimeModels: [NewReleasesAnimeModel] = (0..<5).flatMap { _ in [
    NewReleasesAnimeModel(imageURL: URL(string: "https://shikimori.io/uploads/poster/animes/35507/main_alt-528a79ed0d5f22e1c954df240efe63c3.jpeg"), title: "Добро пожаловать в класс превосходства", subtitle: "Добро пожаловать в класс превосходства", season: 4, episode: 13, isTV: true),
    NewReleasesAnimeModel(imageURL: URL(string: "https://shikimori.io/uploads/poster/animes/62076/main_alt-d79ac691463b536120322c6b2c89eba1.jpeg"), title: "История о перекуре за супермаркетом", subtitle: "История о перекуре за супермаркетом", season: 1, episode: 4, isTV: false)
]}
