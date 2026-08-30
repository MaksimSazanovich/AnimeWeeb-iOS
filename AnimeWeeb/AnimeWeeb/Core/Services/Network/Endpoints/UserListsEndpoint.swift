//
//  UserListsEndpoint.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

public enum UserListsEndpoint: Endpoint {
    case getMy(accessToken: String)
    case postUserList(accessToken: String, titleID: Int, listType: Int)
    
    public var method: HTTPMethod {
        switch self {
        case .getMy: .get
        case .postUserList: .post
        }
    }
    
    public var path: String {
        switch self {
        case .getMy: return "user-lists/my"
        case .postUserList: return "user-lists"
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        case .getMy(let accessToken):
            return ["Authorization": "Bearer \(accessToken)"]
        case .postUserList(let accessToken, let titleID, let listType):
            return ["Authorization": "Bearer \(accessToken)"]
        }
    }
    
    public var queryItems: [URLQueryItem]? {
        nil
    }
    
    public var body: RequestBody {
        switch self {
        case .getMy:
            .plain
        case .postUserList(_, let titleID, let listType):
            .json(UserListRequest(titleID: titleID, listType: listType))
        }
    }
}
