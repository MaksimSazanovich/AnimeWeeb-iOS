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
    private(set) var userAnimeListsViewModel: UserAnimeListsViewModel

    private let userService: UserService
    private let authRepository: AuthRepositoryProtocol
    private let userRepository: UserRepositoryProtocol
    private let animeDetailsRepository: AnimeDetailsRepositoryProtocol
    private let userListsRepository: UserListsRepositoryProtocol

    var onRoute: ((Screen) -> Void)?

    var user: User {
        userService.user ?? previewUser
    }

    var authState: AuthState {
        userService.authState
    }

    var cardState: ProfileCardState = .idle
    var state: ViewState = .empty

    init(
        userService: UserService,
        authRepository: AuthRepositoryProtocol,
        userRepository: UserRepositoryProtocol,
        animeDetailsRepository: AnimeDetailsRepositoryProtocol,
        userListsRepository: UserListsRepositoryProtocol) {

            self.userService = userService
            self.authRepository = authRepository
            self.userRepository = userRepository
            self.animeDetailsRepository = animeDetailsRepository
            self.userListsRepository = userListsRepository

            self.profileEditViewModel = ProfileEditViewModel(
                model: ProfileEditModel(oldUser: userService.user ?? previewUser),
                userRepository: userRepository,
                userService: userService
            )

            self.watchHistoryViewModel = WatchHistoryViewModel(userRepository: userRepository, animeDetailsRepository: animeDetailsRepository)

            self.userAnimeListsViewModel = UserAnimeListsViewModel(userListsRepository: userListsRepository)

            profileEditViewModel.onSaved = { [weak self] in
                self?.cardState = .idle
            }

            watchHistoryViewModel.onRoute = { [weak self] screen in
                self?.onRoute?(screen)
            }

            userAnimeListsViewModel.onCardTap = { [weak self] animeID in
                self?.onRoute?(Screen.animeDetails(animeID: animeID))
            }
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
