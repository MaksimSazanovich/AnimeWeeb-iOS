//
//  AuthEndpoint.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

public enum AuthEndpoint: Endpoint {
    case google(idToken: String, deviceID: String, deviceName: String)
    case refresh(refreshToken: String, deviceID: String, deviceName: String)
    
    public var method: HTTPMethod {
        switch self {
        case .google: .post
        case .refresh: .post
        }
    }
    
    public var path: String {
        switch self {
        case .google: return "auth/google"
        case .refresh: return "auth/refresh"
        }
    }
    
    public var headers: [String : String]? {
        nil
    }
    
    public var queryItems: [URLQueryItem]? {
        nil
    }
    
    public var body: (any Encodable)? {
        switch self {
        case .google(let idToken, let deviceID, let deviceName):
            return GoogleAuthRequestDTO(idToken: idToken, deviceId: deviceID, deviceName: deviceName)
        case .refresh(let refreshToken, let deviceID, let deviceName):
            return RefreshRequestDTO(refreshToken: refreshToken, deviceId: deviceID, deviceName: deviceName)
        }
    }
}
