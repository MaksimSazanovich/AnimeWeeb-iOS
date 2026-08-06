//
//  PreviewData.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

let previewNewReleasesAnimeModel = NewReleasesAnimeModel(imageURL: URL(string: "https://shikimori.io/uploads/poster/animes/35507/main_alt-528a79ed0d5f22e1c954df240efe63c3.jpeg"), title: "Добро пожаловать в класс превосходства", subtitle: "Добро пожаловать в класс превосходства", season: 4, episode: 13, isTV: true)

let previewNewReleasesAnimeModels: [NewReleasesAnimeModel] = (0..<5).flatMap { _ in [
    NewReleasesAnimeModel(imageURL: URL(string: "https://shikimori.io/uploads/poster/animes/35507/main_alt-528a79ed0d5f22e1c954df240efe63c3.jpeg"), title: "Добро пожаловать в класс превосходства", subtitle: "Добро пожаловать в класс превосходства", season: 4, episode: 13, isTV: true),
    NewReleasesAnimeModel(imageURL: URL(string: "https://shikimori.io/uploads/poster/animes/62076/main_alt-d79ac691463b536120322c6b2c89eba1.jpeg"), title: "История о перекуре за супермаркетом", subtitle: "История о перекуре за супермаркетом", season: 1, episode: 4, isTV: false),
    NewReleasesAnimeModel(imageURL: URL(string: "https://shikimori.io/uploads/poster/animes/5680/main_alt-1f395adf0382f6f201b232c84a6dca6d.jpeg"), title: "Кэйон!", subtitle: "Кэйон!", season: 1, episode: 1, isTV: true)
]}

let previewAnimeModel = AnimeModel(imageURL: URL(string: "https://shikimori.io/uploads/poster/animes/62076/main_alt-d79ac691463b536120322c6b2c89eba1.jpeg"), title: "История о перекуре за супермаркетом", genres: [.seinen, .romance])

let previewAnimeModels: [AnimeModel] = (0..<5).flatMap { _ in [
    AnimeModel(imageURL: URL(string: "https://shikimori.io/uploads/poster/animes/62076/main_alt-d79ac691463b536120322c6b2c89eba1.jpeg"), title: "История о перекуре за супермаркетом", genres: [.seinen, .romance]),
    AnimeModel(imageURL: URL(string: "https://shikimori.io/uploads/poster/animes/52211/main_alt-deed3b52403287a438a160008242560f.jpeg"), title: "Магия и мускулы", genres: [.shonen, .fantasy, .action, .comedy]),
    AnimeModel(imageURL: URL(string: "https://shikimori.io/uploads/poster/animes/5680/main_alt-1f395adf0382f6f201b232c84a6dca6d.jpeg"), title: "Кэйон!", genres: [.comedy]),
    AnimeModel(imageURL: URL(string: "https://shikimori.io/uploads/poster/animes/54726/main_alt-bee018ad113099c1d16dd9fc77dd3057.jpeg"), title: "Если бы моя жена стала младшеклассницей", genres: [.comedy, .seinen, .romance])
]}

let previewUserProfileIcon = URL(string: "https://lh3.googleusercontent.com/a/ACg8ocKLZtHNr6Zmas68qSITdLdEioxLLnmJZQZ6vNukWls6ZPzQTsA9=s96-c")
