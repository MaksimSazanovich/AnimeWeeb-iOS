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
    private let animeDetailsRepository: AnimeDetailsRepositoryProtocol
    private let userListsRepository: UserListsRepositoryProtocol

    private(set) var watchStatusPickerViewModel: WatchStatusPickerViewModel

    let animeID: Int

    private(set) var state: ViewState = .idle

    init(animeID: Int,
         animeDetailsRepository: AnimeDetailsRepositoryProtocol,
         userListsRepository: UserListsRepositoryProtocol) {
        self.animeID = animeID
        self.animeDetailsRepository = animeDetailsRepository
        self.userListsRepository = userListsRepository

        self.watchStatusPickerViewModel = WatchStatusPickerViewModel(userListsRepository: userListsRepository, animeID: animeID)
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

    var description: String {
        return model?.description ?? "Нет описания"
    }
    
    var seasons: [Season] {
        return model?.seasons ?? []
    }
    
    var totalEpisodes: Int {
        return model?.seasons.reduce(0) {$0 + $1.episodesCount } ?? -1
    }

    var onRoute: ((Screen) -> Void)?

    func loadDetails() async {
        guard state != .loaded && state != .loading else { return }

        state = .loading

        do {
            model = try await animeDetailsRepository.fetchAnimeDetails(id: animeID)

            if model == nil {
                state = .failed(NetworkError.emptyResponse)
            } else {
                state = .loaded
            }
            print(model?.seasons.first?.episodesCount ?? -1)
        } catch {
            state = .failed(error)
        }
    }
    
    func didSelectEpisode(episode: Episode, season: Season) {
        onRoute?(Screen.watch(model: WatchModel(animeID: animeID, title: title, season: season.name, playerProvider: .native(episodeID: episode.id), seasons: seasons)))
    }
}
