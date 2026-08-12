//
//  HomeViewModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

@Observable
final class HomeViewModel {
    
    private(set) var model: HomeModel?
    private let repository: HomeRepositoryProtocol
    
    private(set) var state: ViewState = .idle
    
    var filteredAnimes: [AnimeModel] {
        guard let animes = model?.animes else { return [] }
        
        return animes.filter { ($0.genres.contains(selectedGenre) || selectedGenre == .all) && ($0.title.localizedCaseInsensitiveContains(searchTerm) || searchTerm.isEmpty) }
    }
    
    var onRoute: ((AnimeModel) -> Void)?
    
    var selectedGenre: Genre = .all
    var searchTerm: String = ""
    var isSearchFocused: Bool = false
    
    init(repository: HomeRepositoryProtocol) {
        self.repository = repository
    }
    
    init(newRealeses: [NewReleasesAnimeModel], animes: [AnimeModel]) {
        self.model = HomeModel(newReleases: newRealeses, animes: animes, totalAnimes: 0)
        self.repository = HomeRepository()
    }
    
    func loadHomeAnimes() async {
        state = .loading
        
        do {
            model = try await repository.fetchHomeAnimes()
            
            if model == nil {
                state = .failed(NetworkError.emptyResponse)
            } else {
                state = .loaded
            }
        } catch {
            state = .failed(error)
        }
    }
    
}
