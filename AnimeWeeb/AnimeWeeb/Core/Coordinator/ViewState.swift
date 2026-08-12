//
//  ViewState.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

enum ViewState {
    case idle
    case empty
    case loading
    case loaded
    case failed(Error)
}
