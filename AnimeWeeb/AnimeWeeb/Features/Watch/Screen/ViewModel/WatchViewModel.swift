//
//  WatchViewModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

@MainActor
@Observable
final class WatchViewModel {
    
    var model: WatchModel
    private let repository: WatchRepositoryProtocol
    
    var title: String {
        model.title
    }
    
    var season: String {
        model.season
    }
    
    var episode: Int {
        model.episode?.episode ?? 0
    }
    
    init(model: WatchModel, repository: WatchRepositoryProtocol) {
        self.model = model
        self.repository = repository
    }
    
    func loadEpisode() async {
        do {
            model.episode = try await repository.fetchEpisode(id: model.episodeID)
        } catch {
            
        }
    }
}
