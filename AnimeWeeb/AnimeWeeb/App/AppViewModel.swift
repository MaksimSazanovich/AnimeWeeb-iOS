//
//  AppViewModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

@MainActor
@Observable
final class AppViewModel {
    private let authRepository: AuthRepositoryProtocol
    private let userService: UserService
    
    init(authRepository: AuthRepositoryProtocol, userService: UserService) {
        self.authRepository = authRepository
        self.userService = userService
    }
    
    func bootstrapApp() async {
        
    }
}
