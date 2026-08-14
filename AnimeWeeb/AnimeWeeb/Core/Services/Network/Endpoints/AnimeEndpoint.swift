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
    
    public var method: HTTPMethod {
        switch self {
            
        case .getHomeAnimes, .getAnimes:
                .get
        }
    }
    
    public var path: String {
        switch self {
            
        case .getHomeAnimes:
            return "/titles/home"
        case .getAnimes(skip: _, take: _):
            return "/titles"
        }
    }
    
    public var headers: [String : String]? {
        return nil
    }
    
    public var queryItems: [URLQueryItem]? {
        switch self {
            
        case .getHomeAnimes:
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
