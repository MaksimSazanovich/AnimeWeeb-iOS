//
//  WatchStatus.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

enum WatchStatus: String, CaseIterable, Identifiable {
    case watching = "Смотрю"
    case completed = "Просмотрено"
    case onHold = "Отложено"
    case dropped = "Брошено"
    case planned = "Планирую"

    var id: String { rawValue }
}
