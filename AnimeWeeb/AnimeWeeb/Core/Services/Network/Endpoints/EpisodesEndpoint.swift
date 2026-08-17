//
//  EpisodesEndpoint.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

public enum EpisodesEndpoint: Endpoint {
    case getEpisode(id: Int)

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        switch self {
        case .getEpisode(id: let id):
            return "/episodes/\(id)"
        }

    }

    public var headers: [String: String]? {
        return nil
    }

    public var queryItems: [URLQueryItem]? {
        return nil
    }

    public var body: (any Encodable)? {
        return nil
    }

}
