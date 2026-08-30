//
//  WatchStatusPickerViewModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

@MainActor
@Observable
final class WatchStatusPickerViewModel {
    private var userListsRepository: UserListsRepositoryProtocol
    private let animeID: Int

    var state: ViewState = .idle
    var selectedStatus: WatchStatus?

    init(userListsRepository: UserListsRepositoryProtocol, animeID: Int) {
        self.userListsRepository = userListsRepository
        self.animeID = animeID
    }

    func postStatus() async {
        guard let selectedStatus else { return }
        state = .loading
        do {
            _ = try await userListsRepository.fetchPostUserList(titleID: animeID, listType: selectedStatus.rawValue)
            state = .idle
        } catch {
            state = .failed(error)
        }
    }
}
