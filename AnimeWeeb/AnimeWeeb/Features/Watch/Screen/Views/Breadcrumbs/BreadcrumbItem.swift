//
//  BreadcrumbItem.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct BreadcrumbItem: Identifiable {
    let screen: Screen
    let title: String

    var id: String { screen.rawValue }
}
