//
//  AuthTokenProvider.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

public protocol AuthTokenProvider: AnyObject {
    func getAccessToken() -> String?
    func refreshToken() async throws -> String
    func clearTokens()
}
