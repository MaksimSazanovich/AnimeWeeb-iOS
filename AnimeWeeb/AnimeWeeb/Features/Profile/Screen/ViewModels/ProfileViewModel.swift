//
//  ProfileViewModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

@MainActor
@Observable
final class ProfileViewModel {

    private let userService: UserService
    private(set) var watchHistory: [WatchHistoryItem]?
    private(set) var userAnimeList: [UserAnimeListItem]?

    var user: User {
        userService.user ?? previewUser
    }

    var authState: AuthState {
        userService.authState
    }

    init(userService: UserService) {
        self.userService = userService
    }

    init(userService: UserService, watchHistory: [WatchHistoryItem], userAnimeList: [UserAnimeListItem]) {
        self.userService = userService
        self.watchHistory = watchHistory
        self.userAnimeList = userAnimeList
    }

    func getUserAnimeList(for status: WatchStatus) -> [UserAnimeListItem] {
        userAnimeList?.filter { $0.status == status } ?? []
    }
}
