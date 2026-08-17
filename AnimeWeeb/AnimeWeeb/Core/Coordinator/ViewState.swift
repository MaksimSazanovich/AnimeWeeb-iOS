//
//  ViewState.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

enum ViewState: Equatable {
    case idle
    case empty
    case loading
    case loaded
    case failed(Error)

    static func == (lhs: ViewState, rhs: ViewState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle),
            (.empty, .empty),
            (.loading, .loading),
            (.loaded, .loaded):
            return true
        case (.failed(let lhsError), .failed(let rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        default:
            return false
        }
    }
}
