//
//  NetworkError.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//


public enum NetworkError: Error {
    case invalidURL
    case invalidBaseURL
    case invalidResponse
    case emptyResponse
    case serverError(statusCode: Int)
    case decodingFailed
}