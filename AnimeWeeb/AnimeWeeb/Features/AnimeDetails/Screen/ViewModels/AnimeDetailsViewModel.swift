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
        } catch {
            state = .failed(error)
        }
    }
}
