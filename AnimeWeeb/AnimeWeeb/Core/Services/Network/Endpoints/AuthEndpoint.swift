//
//  AuthEndpoint.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

public enum AuthEndpoint: Endpoint {
    case google(idToken: String, deviceID: String, deviceName: String)
    
    public var method: HTTPMethod {
        switch self {
        case .google: .post
        }
    }
    
    public var path: String {
        switch self {
        case .google: return "auth/google"
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
        }
    }
}
