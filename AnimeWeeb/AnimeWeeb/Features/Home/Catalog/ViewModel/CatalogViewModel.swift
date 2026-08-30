//
//  CatalogViewModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation
import SwiftUI

@MainActor
@Observable
final class CatalogViewModel {
    private(set) var state: ViewState = .idle
    private let repository: HomeRepositoryProtocol

    var onMoreAnimesLoaded: (([AnimeModel]) -> Void)?
    var canLoadMore: (() -> (loadedCount: Int, totalCount: Int)?)?

    init(repository: HomeRepositoryProtocol) {
        self.repository = repository
    }

    func loadMoreAnimes(skip: Int, take: Int = 20) async {

        guard state != .loading else { return }

        if let (loadedCount, totalCount) = canLoadMore?() {
            guard loadedCount < totalCount else { return }
        }

        state = .loading

        do {
           let newAnimes = try await repository.fetchMoreAnimes(skip: skip, take: take)
            // currentModel.animes.append(contentsOf: newAnimes)
            // self.model = currentModel
            onMoreAnimesLoaded?(newAnimes)
            state = .idle
        } catch {
            state = .failed(error)
        }
    }
}
