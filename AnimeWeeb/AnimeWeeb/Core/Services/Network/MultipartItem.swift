//
//  MultipartItem.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

public struct MultipartItem {
    let name: String
    let data: Data
    let fileName: String?
    let mimeType: String?

    public static func text(name: String, value: String) -> MultipartItem {
        MultipartItem(name: name, data: Data(value.utf8), fileName: nil, mimeType: nil)
    }

    public static func file(name: String, data: Data, fileName: String, mimeType: String? = nil) -> MultipartItem {
        MultipartItem(name: name, data: data, fileName: fileName, mimeType: mimeType)
    }
}
