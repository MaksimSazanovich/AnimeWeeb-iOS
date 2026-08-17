//
//  Endpoint.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

public protocol Endpoint {
    var method: HTTPMethod { get }
    var baseURL: URL { get }
    var path: String { get }
    var headers: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
    var body: Encodable? { get }
}

extension Endpoint {

    public var baseURL: URL {
        return URL(string: "https://weebstudios-002-site1.ktempurl.com/api")!
    }

   func makeURLRequest() throws -> URLRequest {

        let url = baseURL.appending(path: path)
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = queryItems

        guard let fullURL = components?.url else { throw NetworkError.invalidURL }

        var request = URLRequest(url: fullURL)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers

        if let body = body {
            request.httpBody = try JSONEncoder().encode(body)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        return request
    }
}
