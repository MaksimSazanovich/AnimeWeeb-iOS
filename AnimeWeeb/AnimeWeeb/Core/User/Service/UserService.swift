//
//  UserService.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

@Observable
final class UserService {
    private(set) var user: User?
    private(set) var authState: AuthState = .guest

    init(user: User? = nil, state: AuthState = .guest) {
        self.user = user
        self.authState = state
    }

    func update(user: User) {
        self.user = user
        self.authState = .authenticated
    }
    
    func logout() {
        self.user = nil
        self.authState = .guest
    }
}
