//
//  WatchHistoryResponse.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

typealias WatchHistoryResponse = [WatchHistoryDTO]

extension WatchHistoryResponse {
    func toDomain() -> [WatchHistoryItem] {
        map { $0.toDomain() }
    }
}
