//
//  HomeViewModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

@MainActor
@Observable
final class HomeViewModel {
    
    private(set) var model: HomeModel?
    private let repository: HomeRepositoryProtocol
    let catalogViewModel: CatalogViewModel
    
    private(set) var state: ViewState = .idle
    
    var filteredAnimes: [AnimeModel] {
        guard let animes = model?.animes else { return [] }
        
        return animes.filter { ($0.genres.contains(selectedGenre) || selectedGenre == .all) && ($0.title.localizedCaseInsensitiveContains(searchTerm) || searchTerm.isEmpty) }
    }
    
    var newReleases: [NewReleasesAnimeModel] {
        model?.newReleases ?? []
    }
    
    var onRoute: ((AnimeModel) -> Void)?
    
    var selectedGenre: Genre = .all
    var searchTerm: String = ""
    var isSearchFocused: Bool = false
    
    init(repository: HomeRepositoryProtocol) {
        self.repository = repository
        self.catalogViewModel = CatalogViewModel(repository: repository)
        
        catalogViewModel.onMoreAnimesLoaded = { [weak self] newAnimes in
            self?.model?.animes.append(contentsOf: newAnimes)
        }
        
        catalogViewModel.canLoadMore = { [weak self] in
            guard let model = self?.model else { return nil }
            return (model.animes.count + model.newReleases.count, /*model.totalAnimes*/61)
        }
    }
    
    init(newRealeses: [NewReleasesAnimeModel], animes: [AnimeModel]) {
        self.model = HomeModel(newReleases: newRealeses, animes: animes, totalAnimes: animes.count)
        self.repository = HomeRepository(networkService: NetworkService())
        self.catalogViewModel = CatalogViewModel(repository: repository)
        state = .loaded
    }
    
    func loadHomeAnimes() async {
        
        guard state != .loaded && state != .loading else { return }
        
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
