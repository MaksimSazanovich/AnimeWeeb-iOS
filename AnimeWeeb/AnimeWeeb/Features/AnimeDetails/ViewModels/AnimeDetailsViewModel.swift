//
//  AnimeDetailsViewModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

@MainActor
@Observable
final class AnimeDetailsViewModel {
    private var model: AnimeModel?
    private let repository: AnimeDetailsRepositoryProtocol

    let animeID: Int
    private(set) var state: ViewState = .idle

    init(animeID: Int, repository: AnimeDetailsRepositoryProtocol) {
        self.animeID = animeID
        self.repository = repository
    }

    var imageURL: URL? {
        return model?.imageURL
    }

    var title: String {
        return model?.title ?? "Unknown"
    }

    var genres: [Genre] {
        return model?.genres ?? []
    }

    var despription: String {
        return model?.description ?? "Нет описания"
    }

    var onRoute: ((Screen) -> Void)?

    func loadDetails() async {
        guard state != .loaded && state != .loading else { return }

        state = .loading

        do {
            model = try await repository.fetchAnimeDetails(id: animeID)

            if model == nil {
                state = .failed(NetworkError.emptyResponse)
            } else {
                state = .loaded
            }
        } catch {
            state = .failed(error)
        }
    }
}
