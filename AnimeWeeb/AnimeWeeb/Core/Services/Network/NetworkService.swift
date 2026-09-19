//
//  NetworkService.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

public final class NetworkService: NetworkServiceProtocol {
    
    private let session: URLSession
    private let decoder: JSONDecoder
    
    public weak var tokenProvider: AuthTokenProvider?

    init(session: URLSession = .shared, decoder: JSONDecoder = .init()) {
        self.session = session
        self.decoder = decoder
    }

    public func request<T: Decodable>(_ endpoint: Endpoint, isRetry: Bool = false) async throws -> T {
        var request = try endpoint.makeURLRequest()
        
        if endpoint.requiresAuth, let token = tokenProvider?.getAccessToken() {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        let (data, response) = try await session.data(for: request)

        guard let httpresponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        guard (200...299).contains(httpresponse.statusCode) else {
            if httpresponse.statusCode == 401 && endpoint.requiresAuth && !isRetry {
                do {
                    _ = try await tokenProvider?.refreshToken()
                    return try await self.request(endpoint, isRetry: true)
                } catch {
                    tokenProvider?.clearTokens()
                    throw NetworkError.serverError(statusCode: httpresponse.statusCode, data: data)
                }
            }
            
            throw NetworkError.serverError(statusCode: httpresponse.statusCode, data: data)
        }

        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}
