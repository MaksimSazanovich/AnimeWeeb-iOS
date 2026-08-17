//
//  Genre.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

enum Genre: Int, CaseIterable, Identifiable {
    case all = 0
    case shounen = 1
    case adventure = 2
    case drama = 3
    case fantasy = 4
    case suspense = 5
    case action = 6
    case comedy = 7
    case seinen = 8
    case mystery = 9
    case supernatural = 10
    case romance = 11
    case shoujo = 12
    case sciFi = 13
    case horror = 14
    case sports = 15
    case gourmet = 16
    case sliceOfLife = 17

    var id: Int { rawValue }

    var title: String {
        switch self {
        case .all: "Все"
        case .shounen: "Сёнэн"
        case .adventure: "Приключения"
        case .drama: "Драма"
        case .fantasy: "Фэнтези"
        case .suspense: "Триллер"
        case .action: "Экшен"
        case .comedy: "Комедия"
        case .seinen: "Сэйнэн"
        case .mystery: "Тайна"
        case .supernatural: "Сверхъестественное"
        case .romance: "Романтика"
        case .shoujo: "Сёдзё"
        case .sciFi: "Фантастика"
        case .horror: "Ужасы"
        case .sports: "Спорт"
        case .gourmet: "Гурман"
        case .sliceOfLife: "Повседневность"
        }
    }
}
