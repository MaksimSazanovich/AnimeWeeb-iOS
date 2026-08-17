//
//  Genre.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

enum Genre: String, CaseIterable, Identifiable {
    case all = "Все"
    case shounen = "Сёнэн"
    case adventure = "Приключения"
    case drama = "Драма"
    case fantasy = "Фэнтези"
    case suspense = "Триллер"
    case action = "Экшен"
    case comedy = "Комедия"
    case seinen = "Сэйнэн"
    case mystery = "Тайна"
    case supernatural = "Сверхъестественное"
    case romance = "Романтика"
    case shoujo = "Сёдзё"
    case sciFi = "Фантастика"
    case horror = "Ужасы"
    case sports = "Спорт"
    case gourmet = "Гурман"
    case sliceOfLife = "Повседневность"

    var id: String { rawValue }
}
