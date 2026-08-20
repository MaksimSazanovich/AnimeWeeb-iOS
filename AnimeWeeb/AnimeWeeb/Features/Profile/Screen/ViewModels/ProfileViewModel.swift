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

    var user: User {
        userService.user ?? previewUser
    }

    var authState: AuthState {
        userService.authState
    }

    init(userService: UserService) {
        self.userService = userService
    }
}
