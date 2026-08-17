//
//  AnimeEndpoint.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

public enum AnimeEndpoint: Endpoint {
    case getHomeAnimes
    case getAnimes(skip: Int, take: Int)
    case getAnime(id: Int)

    public var method: HTTPMethod {
        switch self {

        case .getHomeAnimes, .getAnimes, .getAnime:
                .get
        }
    }

    public var path: String {
        switch self {

        case .getHomeAnimes:
            return "/titles/home"
        case .getAnimes:
            return "/titles"
        case .getAnime(let id):
            return "/titles/\(id)"
        }
    }

    public var headers: [String: String]? {
        return nil
    }

    public var queryItems: [URLQueryItem]? {
        switch self {

        case .getHomeAnimes, .getAnime:
            return nil
        case .getAnimes(skip: let skip, take: let take):
            return [
                URLQueryItem(name: "skip", value: "\(skip)"),
                URLQueryItem(name: "take", value: "\(take)")
            ]
        }
    }

    public var body: (any Encodable)? {
        return nil
    }

}
