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
            if let newUserName = model.newUser?.name {
                return newUserName
            } else {
               return  model.oldUser.name
            }
        }
        set {
            model.newUser?.name = newValue
        }
    }
    
    var state: ViewState = .empty
    
    init(model: ProfileEditModel) {
        self.model = model
    }
    
    func updateAvatar(avatar: Data) {
        model.avatar = avatar
    }
    
    func clear() {
        model.newUser = model.oldUser
    }
}
