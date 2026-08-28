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
    case registerConfirm(email: String, code: String, name: String, avatar: Data, deviceID: String, deviceName: String)

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
        case .registerConfirm: return "auth/register/confirm"
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
        case .google(let idToken, let deviceID, let deviceName):
            return .json(GoogleAuthRequest(idToken: idToken, deviceID: deviceID, deviceName: deviceName))
        case .refresh(let refreshToken, let deviceID, let deviceName):
            return .json(RefreshRequest(refreshToken: refreshToken, deviceID: deviceID, deviceName: deviceName))
        case .logout(let refreshToken, let deviceID, let deviceName):
            return .json(LogoutRequest(refreshToken: refreshToken, deviceID: deviceID, deviceName: deviceName))
        case .loginRequestCode(email: let email):
            return .json(LoginCodeRequest(email: email))
        case .loginConfirm(let email, let code, let deviceID, let deviceName):
            return .json(LoginConfirmRequest(email: email, code: code, deviceID: deviceID, deviceName: deviceName))
        case .registerRequestCode(let email):
            return .json(RegisterCodeRequest(email: email))
        case .registerConfirm(let email, let code, let name, let avatar, let deviceID, let deviceName):
            return .multipart([
                .text(name: "Email", value: email),
                .text(name: "Code", value: code),
                .text(name: "Name", value: name),
                .file(name: "Avatar", data: avatar, fileName: "avatar.jpg", mimeType: "image/jpeg"),
                .text(name: "DeviceId", value: deviceID),
                .text(name: "DeviceName", value: deviceName)
            ])
        }
    }
}
