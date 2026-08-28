//
//  RequestBody.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

public enum RequestBody {
    case json(Encodable)
    case multipart([MultipartItem])
    case plain
}
