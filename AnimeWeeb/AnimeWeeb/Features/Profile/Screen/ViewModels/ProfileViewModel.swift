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

    private(set) var profileEditViewModel: ProfileEditViewModel
    private(set) var watchHistoryViewModel: WatchHistoryViewModel

    private let userService: UserService
    private let authRepository: AuthRepositoryProtocol
    private let userRepository: UserRepositoryProtocol
    private let animeDetailsRepository: AnimeDetailsRepositoryProtocol

    private(set) var userAnimeList: [UserAnimeListItem]?

    var onRoute: ((Screen) -> Void)?

    var user: User {
        userService.user ?? previewUser
    }

    var authState: AuthState {
        userService.authState
    }

    var cardState: ProfileCardState = .idle
    var state: ViewState = .empty

    init(userService: UserService,
         authRepository: AuthRepositoryProtocol,
         userRepository: UserRepositoryProtocol,
         animeDetailsRepository: AnimeDetailsRepositoryProtocol) {

        self.userService = userService
        self.authRepository = authRepository
        self.userRepository = userRepository
        self.animeDetailsRepository = animeDetailsRepository

        self.profileEditViewModel = ProfileEditViewModel(
            model: ProfileEditModel(oldUser: userService.user ?? previewUser),
            userRepository: userRepository,
            userService: userService
        )

        self.watchHistoryViewModel = WatchHistoryViewModel(userRepository: userRepository, animeDetailsRepository: animeDetailsRepository)

        profileEditViewModel.onSaved = { [weak self] in
            self?.cardState = .idle
        }

        watchHistoryViewModel.onRoute = { [weak self] screen in
            self?.onRoute?(screen)
        }
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

    func didTapEdit() {
        cardState = .edit
    }

    func didTapCancelEdit() {
        profileEditViewModel.clear()
        cardState = .idle
    }

}
