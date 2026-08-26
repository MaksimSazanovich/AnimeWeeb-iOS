//
//  Screen.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

enum Screen: Hashable {
    case home
    case login
    case register
    case otpVerification(email: String)
    case animeDetails(animeID: Int)
    case watch(model: WatchModel)
    case profile
}

extension Screen {
    var rawValue: String {
        switch self {
        case .home: return "home"
        case .login: return "login"
        case .register: return "register"
        case .otpVerification: return "otpVerification"
        case .animeDetails(animeID: let id): return "animeDetails_\(id)"
        case .watch(model: let model): return "watch_\(model.episodeID)"
        case .profile: return "profile"
        }
    }
}
