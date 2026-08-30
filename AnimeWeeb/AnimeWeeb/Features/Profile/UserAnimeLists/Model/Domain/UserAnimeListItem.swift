//
//  UserAnimeListItem.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct UserAnimeListItem: Identifiable {
    var id: Int { titleID }

    let titleID: Int
    let imageURL: URL?
    let title: String
    var status: WatchStatus
}

typealias UserAnimeListsModel = [UserAnimeListItem]
