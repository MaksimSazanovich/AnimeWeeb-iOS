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
    
    var title: String {
        model.title
    }
    
    var season: String {
        model.season
    }
    
    var episode: Int {
        model.episode?.episode ?? -1
    }
    
    init(model: WatchModel) {
        self.model = model
    }
    
    func loadEpisode() async {
        
    }
}
