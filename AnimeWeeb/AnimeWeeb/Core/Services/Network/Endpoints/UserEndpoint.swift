//
//  UserEndpoint.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

public enum UserEndpoint: Endpoint {
    case getMe(accessToken: String)

    public var method: HTTPMethod {
        switch self {
        case .getMe: .post
        }
    }

    public var path: String {
        switch self {
        case .getMe: return "user/me"
        }
    }

    public var headers: [String : String]? {
        nil
    }

    public var queryItems: [URLQueryItem]? {
        nil
    }

    public var body: RequestBody {
        switch self {
        case .getMe(accessToken: let accessToken):
            return .json(UserRequest(accessToken: accessToken))
        }
    }

}
