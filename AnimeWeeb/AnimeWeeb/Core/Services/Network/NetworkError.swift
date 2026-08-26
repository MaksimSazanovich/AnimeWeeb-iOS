//
//  NetworkError.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

public enum NetworkError: Error, LocalizedError {
    case invalidURL
    case invalidBaseURL
    case invalidResponse
    case emptyResponse
    case serverError(statusCode: Int, data: Data?)
    case decodingFailed

    public var errorDescription: String? {
        switch self {
        case .invalidURL, .invalidBaseURL:
            return "Неверный адрес сервера."
        case .invalidResponse:
            return "Некорректный ответ от сервера."
        case .emptyResponse:
            return "Сервер вернул пустой ответ."
        case .serverError(let statusCode, let data):
            return "Ошибка сервера (\(statusCode)). Попробуйте позже."
        case .decodingFailed:
            return "Не удалось обработать данные от сервера."
        }
    }
}
