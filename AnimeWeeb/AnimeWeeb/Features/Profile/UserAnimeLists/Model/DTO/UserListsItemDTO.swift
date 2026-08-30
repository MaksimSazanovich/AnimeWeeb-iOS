//
//  UserListsItemDTO.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct UserListsItemDTO: Decodable {
    let id, titleID: Int
       let titleNameRu, titleNameEn: String
       let posterURL: String
       let listType: Int
       let addedAt: String

       enum CodingKeys: String, CodingKey {
           case id
           case titleID = "titleId"
           case titleNameRu, titleNameEn
           case posterURL = "posterUrl"
           case listType, addedAt
       }
}

extension UserListsItemDTO {
    func toDomain() -> UserAnimeListItem {
        UserAnimeListItem(titleID: titleID, imageURL: URL(string: posterURL), title: titleNameRu, status: WatchStatus(rawValue: listType) ?? .planned)
    }
}
