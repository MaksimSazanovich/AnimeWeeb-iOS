//
//  WatchStatus.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

enum WatchStatus: Int, CaseIterable, Identifiable {
    case watching = 1
    case completed = 2
    case onHold = 3
    case dropped = 4
    case planned = 5

    var id: Int { rawValue }

    var name: String {
        switch self {
        case .watching: return "Смотрю"
        case .completed: return "Просмотрено"
        case .onHold: return "Отложено"
        case .dropped: return "Брошено"
        case .planned: return "Планирую"
        }
    }
}
