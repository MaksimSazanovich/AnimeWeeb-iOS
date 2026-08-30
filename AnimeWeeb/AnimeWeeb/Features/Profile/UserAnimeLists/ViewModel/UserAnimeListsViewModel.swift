//
//  UserAnimeListsViewModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

@MainActor
@Observable
final class UserAnimeListsViewModel {

    private let userListsRepository: UserListsRepositoryProtocol
    private(set) var userAnimeList: [UserAnimeListItem] = []

    var selectedStatus: WatchStatus = .watching
    var state: ViewState = .idle

    var onCardTap: ((Int) -> Void)?

    init(userListsRepository: UserListsRepositoryProtocol) {
        self.userListsRepository = userListsRepository
    }

    func getUserAnimeList(for status: WatchStatus) -> [UserAnimeListItem] {
        let animeList = userAnimeList.filter { $0.status == status }

        return animeList
    }

    func getLists() async {
        do {
            state = .loading
            userAnimeList = try await userListsRepository.fetchGetMy()

            if userAnimeList.isEmpty {
                state = .empty
            } else {
                state = .loaded
            }
        } catch {
            state = .failed(error)
        }
    }

    func didTapSelectStatus(status: WatchStatus) {
        selectedStatus = status
    }
}
