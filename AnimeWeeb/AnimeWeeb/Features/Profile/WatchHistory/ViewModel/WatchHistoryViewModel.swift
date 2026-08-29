//
//  WatchHistoryViewModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

@MainActor
@Observable
final class WatchHistoryViewModel {

    private let userRepository: UserRepositoryProtocol
    private let animeDetailsRepository: AnimeDetailsRepositoryProtocol

    private var model: [WatchHistoryItem]?

    var state: ViewState = .idle

    var watchHistory: [WatchHistoryCardModel] = []

    var onRoute: ((Screen) -> Void)?

    init(userRepository: UserRepositoryProtocol, animeDetailsRepository: AnimeDetailsRepositoryProtocol) {
        self.userRepository = userRepository
        self.animeDetailsRepository = animeDetailsRepository
    }

    func loadWatchHistory() async {
        guard state != .loaded && state != .loading else { return }
        state = .loading

        let historyItems: [WatchHistoryItem]

        do {
            historyItems = try await userRepository.fetchGetUserHistory()
            print(historyItems.count)
            if historyItems.isEmpty {
                state = .empty
                return
            }

            let details = try await withThrowingTaskGroup(of: (Int, AnimeModel).self) { group in
                for item in historyItems {
                    group.addTask {
                        let detail = try await self.animeDetailsRepository.fetchAnimeDetails(id: item.titleID)
                        return (item.titleID, detail)
                    }
                }

                var results: [Int: AnimeModel] = [:]
                for try await (id, detail) in group {
                    results[id] = detail
                }
                return results
            }

            self.watchHistory = historyItems.compactMap { item in
                guard let anime = details[item.titleID] else { return nil }

                let seasonName = anime.seasons.first(where: { $0.seasonNumber == item.season })?.seasonName
                print(seasonName)
                return WatchHistoryCardModel(
                    title: anime.title,
                    imageURL: anime.imageURL,
                    season: item.season,
                    seasonName: seasonName ?? "",
                    episode: item.episode,
                    stoppedAtSeconds: item.stoppedAtSeconds,
                    titleID: item.titleID,
                    playerProvider: item.playerProvider
                )
            }

            state = .loaded

        } catch {
            guard !Task.isCancelled else { return }
            state = .failed(error)
        }
    }

}
