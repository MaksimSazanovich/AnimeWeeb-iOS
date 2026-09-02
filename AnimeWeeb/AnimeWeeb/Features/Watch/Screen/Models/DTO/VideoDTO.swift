//
//  VideoDTO.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct VideoDTO: Codable {
    let id, dubberID: Int
    let dubberName, dubberLanguage: String
    let videoFormatID: Int
    let videoFormat, resolution: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case id
        case dubberID = "dubberId"
        case dubberName, dubberLanguage
        case videoFormatID = "videoFormatId"
        case videoFormat, resolution, url
    }
}

extension VideoDTO {
    func toDomain() -> Video {
        Video(dubberName: dubberName, quality: QualityType(rawValue: resolution) ?? .q360p, url: URL(string: url))
    }
}
