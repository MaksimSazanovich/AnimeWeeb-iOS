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
    case logout(refreshToken: String, deviceID: String, deviceName: String)
    case loginRequestCode(email: String)
    case loginConfirm(email: String, code: String, deviceID: String, deviceName: String)
    case registerRequestCode(email: String)

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        switch self {
        case .google: return "auth/google"
        case .refresh: return "auth/refresh"
        case .logout: return "auth/logout"
        case .loginRequestCode: return "auth/login/request-code"
        case .loginConfirm: return "auth/login/confirm"
        case .registerRequestCode: return "auth/register/request-code"
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
            return GoogleAuthRequest(idToken: idToken, deviceID: deviceID, deviceName: deviceName)
        case .refresh(let refreshToken, let deviceID, let deviceName):
            return RefreshRequest(refreshToken: refreshToken, deviceID: deviceID, deviceName: deviceName)
        case .logout(let refreshToken, let deviceID, let deviceName):
            return LogoutRequest(refreshToken: refreshToken, deviceID: deviceID, deviceName: deviceName)
        case .loginRequestCode(email: let email):
            return LoginCodeRequest(email: email)
        case .loginConfirm(let email, let code, let deviceID, let deviceName):
            return LoginConfirmRequest(email: email, code: code, deviceID: deviceID, deviceName: deviceName)
        case .registerRequestCode(let email):
            return RegisterCodeRequest(email: email)
        }
    }
}
