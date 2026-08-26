//
//  AuthError.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

enum AuthError: Error, LocalizedError {
    case noRootViewController
    case signInFailed(String)
    case cancelled
    case noRefreshToken
    case logoutFailed
    case noAccount
    case noCode
    case unknown

    var errorDescription: String? {
        switch self {
        case .noRootViewController:
            return "Не удалось найти активный контроллер для отображения окна входа."
        case .signInFailed(let message):
            return "Ошибка авторизации: \(message)"
        case .cancelled:
            return "Авторизация была отменена пользователем."
        case .noRefreshToken:
            return "Refresh token протух."
        case .logoutFailed:
            return "Не удалось выйти из аккаунта."
        case .noAccount:
            return "У вас нет аккаунта, пожалуйста зарегистрируйтесь, чтобы войти"
        case .noCode:
            return "Код неверный или уже истёк.\nЗапросите новый код и попробуйте ещё раз."
        case .unknown:
            return "Произошла неизвестная ошибка при попытке входа."
        }
    }
}
