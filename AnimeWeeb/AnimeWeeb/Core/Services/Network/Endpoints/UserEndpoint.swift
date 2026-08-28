//
//  UserEndpoint.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

public enum UserEndpoint: Endpoint {
    case getMe(accessToken: String)
    case update(accessToken: String, name: String?, avatar: Data?)

    public var method: HTTPMethod {
        switch self {
        case .getMe, .update: .post
        }
    }

    public var path: String {
        switch self {
        case .getMe: return "user/me"
        case .update: return "user/update"
        }
    }

    public var headers: [String : String]? {
        switch self {
        case .update(let accessToken, _, _):
            return ["Authorization": "Bearer \(accessToken)"]
        default:
            return nil
        }
    }

    public var queryItems: [URLQueryItem]? {
        nil
    }

    public var body: RequestBody {
        switch self {
        case .getMe(accessToken: let accessToken):
            return .json(UserRequest(accessToken: accessToken))
        case .update(_, name: let name, avatar: let avatar):
            var items: [MultipartItem] = []
            if let name {
                items.append(.text(name: "Name", value: name))
            }
            if let avatar {
                items.append(.file(name: "Avatar", data: avatar, fileName: "avatar.jpg", mimeType: "image/jpeg"))
            }
            return .multipart(items)
        }
    }

}
