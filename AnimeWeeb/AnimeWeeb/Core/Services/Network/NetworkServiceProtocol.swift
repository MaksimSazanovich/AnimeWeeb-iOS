//
//  NetworkServiceProtocol.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

public protocol NetworkServiceProtocol {
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T
}
