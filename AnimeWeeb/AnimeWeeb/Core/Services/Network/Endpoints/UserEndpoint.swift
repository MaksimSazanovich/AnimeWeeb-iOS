//
//  UserEndpoint.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

enum UserEndpoint: Endpoint {
    case getMe(accessToken: String)
    case update(name: String?, avatar: Data?)
    case getWatchHistory
    case postWatchHistory(titleID: Int, episodeID: Int, source: String, seasonNumber: Int, episodeNumber: Int, stoppedAtSeconds: Int)
    
    public var method: HTTPMethod {
        switch self {
        case .getMe, .update, .postWatchHistory: .post
        case .getWatchHistory: .get
        }
    }
    
    public var path: String {
        switch self {
        case .getMe: return "user/me"
        case .update: return "user/update"
        case .getWatchHistory: return "user/watch-history"
        case .postWatchHistory: return "user/watch-history"
        }
    }
    
    public var headers: [String : String]? {
        return nil
    }
    
    public var queryItems: [URLQueryItem]? {
        nil
    }
    
    public var body: RequestBody {
        switch self {
        case .getMe(accessToken: let accessToken):
            return .json(UserRequest(accessToken: accessToken))
        case .update(name: let name, avatar: let avatar):
            var items: [MultipartItem] = []
            if let name {
                items.append(.text(name: "Name", value: name))
            }
            if let avatar {
                items.append(.file(name: "Avatar", data: avatar, fileName: "avatar.jpg", mimeType: "image/jpeg"))
            }
            return .multipart(items)
        case .postWatchHistory(titleID: let titleID,
                               episodeID: let episodeID,
                               source: let source,
                               seasonNumber: let seasonNumber,
                               episodeNumber: let episodeNumber,
                               stoppedAtSeconds: let stoppedAtSeconds
        ):
            return .json(WatchHistoryRequest(titleID: titleID,
                                             episodeID: episodeID,
                                             source: source,
                                             seasonNumber: seasonNumber,
                                             episodeNumber: episodeNumber,
                                             stoppedAtSeconds: stoppedAtSeconds))
        default:
            return .plain
        }
    }
    
    public var requiresAuth: Bool {
        switch self {
        case .update, .getWatchHistory, .postWatchHistory:
            return true
        default:
            return false
        }
    }
}
