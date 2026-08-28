//
//  ProfileEditViewModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

@MainActor
@Observable
final class ProfileEditViewModel {

    private let userRepository: UserRepositoryProtocol
    private let userService: UserService

    private var model: ProfileEditModel {
        didSet {
            if model.hasChanges {
                state = .idle
            } else {
                state = .empty
            }
        }
    }

    var nickname: String {
        get {
            if model.newUser.name != model.oldUser.name {
                return model.newUser.name
            } else {
               return  model.oldUser.name
            }
        }
        set {
            model.newUser.name = newValue
        }
    }

    var state: ViewState = .empty

    var onSaved: (() -> Void)?

    init(model: ProfileEditModel, userRepository: UserRepositoryProtocol, userService: UserService) {
        self.model = model
        self.userRepository = userRepository
        self.userService = userService
    }

    func updateAvatar(avatar: Data) {
        model.avatar = avatar
    }

    func clear() {
        model.newUser = model.oldUser
    }

    func save() async {
        Task {
            do {
                state = .loading
                let user: User = try await userRepository.fetchUpdate(name: model.newUser.name, avatar: model.avatar)
                state = .loaded
                userService.update(user: user)
                onSaved?()
            } catch {
                state = .failed(error)
            }
        }
    }
}
