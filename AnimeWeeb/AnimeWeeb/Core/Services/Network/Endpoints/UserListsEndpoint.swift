//
//  UserListsEndpoint.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

public enum UserListsEndpoint: Endpoint {
    case getMy(accessToken: String)

    public var method: HTTPMethod {
        switch self {
        case .getMy: .get
        }
    }

    public var path: String {
        switch self {
        case .getMy: return "user-lists/my"
        }
    }

    public var headers: [String : String]? {
        switch self {
        case .getMy(let accessToken):
            return ["Authorization": "Bearer \(accessToken)"]
        }
    }

    public var queryItems: [URLQueryItem]? {
        nil
    }

    public var body: RequestBody {
        .plain
    }
}
