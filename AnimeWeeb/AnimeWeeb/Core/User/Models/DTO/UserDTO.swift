//
//  UserDTO.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct UserDTO: Codable {
    let id: Int
    let email, name: String
    let avatarPath: String
    let level, role: Int
    let createdAt: String
}

extension UserDTO {
    func toDomain() -> User {
        return User(id: id, email: email, name: name, avatarPath: makeFullAvatarURL(from: avatarPath), level: level)
    }

    private func makeFullAvatarURL(from path: String?) -> URL? {
        guard let path = path, !path.isEmpty else { return nil }

        if path.hasPrefix("http://") || path.hasPrefix("https://") {
            return URL(string: path)
        }

        let baseURL = "https://animeweeb.site/backend-media"
        let targetWord = "/uploads"

        let relativePath: String
        if let range = path.range(of: targetWord) {
            relativePath = String(path[range.upperBound...])
        } else {
            relativePath = path.hasPrefix("/") ? path : "/\(path)"
        }

        return URL(string: baseURL + relativePath)
    }
}
