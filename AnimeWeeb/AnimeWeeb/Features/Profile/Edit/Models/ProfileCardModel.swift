//
//  ProfileEditModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct ProfileEditModel {
    let oldUser: User
    var newUser: User?
    
    var avatar: Data?
    
    var hasChanges: Bool {
        oldUser != newUser || avatar != nil
    }
    
    init(oldUser: User) {
        self.oldUser = oldUser
        self.newUser = oldUser
    }
}
