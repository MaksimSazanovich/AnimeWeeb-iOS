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
    private let authRepository: AuthRepositoryProtocol

    private(set) var watchHistory: [WatchHistoryItem]?
    private(set) var userAnimeList: [UserAnimeListItem]?

    var onRoute: ((Screen) -> Void)?

    var user: User {
        userService.user ?? previewUser
    }

    var authState: AuthState {
        userService.authState
    }

    init(userService: UserService, authRepository: AuthRepositoryProtocol) {
        self.userService = userService
        self.authRepository = authRepository
    }

    init(userService: UserService,
         authRepository: AuthRepositoryProtocol,
         watchHistory: [WatchHistoryItem],
         userAnimeList: [UserAnimeListItem]) {
        self.userService = userService
        self.authRepository = authRepository
        self.watchHistory = watchHistory
        self.userAnimeList = userAnimeList
    }

    func getUserAnimeList(for status: WatchStatus) -> [UserAnimeListItem] {
        userAnimeList?.filter { $0.status == status } ?? []
    }

    func didTapLogout() async {
        do {
            _ = try await authRepository.fetchLogout()
            userService.logout()
            onRoute?(Screen.home)
        } catch {

        }
    }
}
