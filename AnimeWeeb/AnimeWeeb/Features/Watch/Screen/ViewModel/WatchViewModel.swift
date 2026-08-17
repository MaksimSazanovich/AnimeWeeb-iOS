//
//  WatchViewModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

@MainActor
@Observable
final class WatchViewModel {

    var model: WatchModel
    private let repository: WatchRepositoryProtocol

    private(set) var breadcrumbs: [BreadcrumbItem] = [
        BreadcrumbItem(screen: .home, title: "Каталог")
    ]

    private(set) var state: ViewState = .idle

    var title: String {
        model.title
    }

    var season: String {
        model.season
    }

    var episode: Int {
        model.episode?.episode ?? 0
    }

    var onRoute: ((Screen) -> Void)?

    init(model: WatchModel, repository: WatchRepositoryProtocol) {
        self.model = model
        self.repository = repository
    }

    func loadEpisode() async {

        guard state != .loaded && state != .loading else { return }

        state = .loading

        do {
            model.episode = try await repository.fetchEpisode(id: model.episodeID)

            breadcrumbs.append(BreadcrumbItem(screen: .animeDetails(animeID: model.titleID), title: model.title))
            breadcrumbs.append(BreadcrumbItem(screen: .watch(model: model), title: "Эпизод \(episode)"))

            if model.episode == nil {
                state = .failed(NetworkError.emptyResponse)
            } else {
                state = .loaded
            }
        } catch {
            state = .failed(error)
        }
    }

    func breadcrumbItemDidTap(_ item: BreadcrumbItem) {
        onRoute?(item.screen)
    }
}
