//
//  GoogleService.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import GoogleSignIn

final class GoogleService {
    
    init() {
        guard let clientID = Bundle.main.object(forInfoDictionaryKey: "GIDClientID") as? String, !clientID.isEmpty else {
            fatalError("GIDClientID is missing in Info.plist")
        }

        guard let serverClientID = Bundle.main.object(forInfoDictionaryKey: "GIDServerClientID") as? String, !serverClientID.isEmpty else {
            fatalError("GIDServerClientID is missing in Info.plist")
        }

        let configuration = GIDConfiguration(clientID: clientID, serverClientID: serverClientID)
        GIDSignIn.sharedInstance.configuration = configuration
    }
    
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
