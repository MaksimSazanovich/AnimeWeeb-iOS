//
//  NetworkServiceProtocol.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

public protocol NetworkServiceProtocol {
    var tokenProvider: AuthTokenProvider? { get set }
    
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T
    func request<T: Decodable>(_ endpoint: Endpoint, isRetry: Bool) async throws -> T
}

extension NetworkServiceProtocol {
    public func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        try await request(endpoint, isRetry: false)
    }
}
