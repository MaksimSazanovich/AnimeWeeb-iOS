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

    init(session: URLSession = .shared, decoder: JSONDecoder = .init()) {
        self.session = session
        self.decoder = decoder
    }

    public func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        let request = try endpoint.makeURLRequest()

        let (data, response) = try await session.data(for: request)

        guard let httpresponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        guard (200...299).contains(httpresponse.statusCode) else {
            throw NetworkError.serverError(statusCode: httpresponse.statusCode, data: data)
        }

        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}
