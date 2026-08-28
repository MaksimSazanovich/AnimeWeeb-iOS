//
//  User.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct User: Equatable {
    let id: Int
    var email: String
    var name: String
    var avatarPath: URL?
    var level: Int
}
