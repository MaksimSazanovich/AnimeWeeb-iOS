//
//  GoogleService.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import GoogleSignIn

final class GoogleService {
    func handleOpenURL(_ url: URL) -> Bool {
        GIDSignIn.sharedInstance.handle(url)
    }

    func restorePreviousSignIn() async throws -> String {
        let user = try await GIDSignIn.sharedInstance.restorePreviousSignIn()

        guard let idToken = user.idToken?.tokenString else {
            throw AuthError.signInFailed("Не удалось получить ID Token")
        }

        return idToken
    }

    @MainActor
    func getGoogleIDToken() async throws -> String {
        guard let rootViewController = UIApplication.shared.rootViewController else {
            throw AuthError.noRootViewController
        }

        let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)

        guard let idToken = result.user.idToken?.tokenString else {
            throw AuthError.signInFailed("Не удалось получить ID Token")
        }

        return idToken
    }
}
