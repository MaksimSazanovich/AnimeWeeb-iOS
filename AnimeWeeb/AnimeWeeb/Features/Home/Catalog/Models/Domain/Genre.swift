//
//  Genre.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

enum Genre: String, CaseIterable, Identifiable {
    case all = "Все"
    case gourmet = "Гурман"
    case drama = "Драма"
    case comedy = "Комедия"
    case sliceOfLife = "Повседневность"
    case adventure = "Приключения"
    case romance = "Романтика"
    case shonen = "Сёнэн"
    case sports = "Спорт"
    case seinen = "Сэйнэн"
    case mystery = "Тайна"
    case thriller = "Триллер"
    case horror = "Ужасы"
    case sciFi = "Фантастика"
    case fantasy = "Фэнтези"
    case action = "Экшен"

    var id: String { rawValue }
}
