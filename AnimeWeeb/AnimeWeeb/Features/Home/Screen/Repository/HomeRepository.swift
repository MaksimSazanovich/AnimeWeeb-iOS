//
//  HomeRepository.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

final class HomeRepository: HomeRepositoryProtocol {
    let baseURL = "https://weebstudios-002-site1.ktempurl.com/api/titles"
    let path = "/home"
    
    func fetchHomeAnimes() async throws -> HomeModel {
        var url = URL(string: baseURL)!
        url.append(path: path)
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpresponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpresponse.statusCode) else {
            throw NetworkError.serverError(statusCode: httpresponse.statusCode)
        }
        
        let dto: HomeResponse
        
        do {
            dto = try JSONDecoder().decode(HomeResponse.self, from: data)
        } catch {
            throw NetworkError.decodingFailed
        }
        
        return dto.toDomain()
    }
}

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case emptyResponse
    case serverError(statusCode: Int)
    case decodingFailed
}
