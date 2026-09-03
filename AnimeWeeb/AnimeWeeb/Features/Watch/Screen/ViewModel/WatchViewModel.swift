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
    private let watchRepository: WatchRepositoryProtocol
    private let animeDetailsRepository: AnimeDetailsRepositoryProtocol
    
    private(set) var breadcrumbs: [BreadcrumbItem] = [
        BreadcrumbItem(screen: .home, title: "Каталог")
    ]
    
    private(set) var state: ViewState = .idle
    
    var title: String {
        model.title
    }
    
    var season: String {
        model.season
    }
    var episode: Episode {
        model.episode ?? previewEpisode
    }
    
    var seasons: [Season] {
        model.seasons ?? []
    }
    
    var qualities: [QualityType] = []
    
    var selectedPlayer: PlayerType = .animeWeeb
    var selectedQuality: QualityType = .q360p
    
    var url: URL? {
        episode.videos.first(where: {$0.quality == selectedQuality})?.url
    }
    
    var timeCode: Double {
        let timeCode = model.timecode ?? 0
        print(timeCode)
        return timeCode
    }
    
    var onRoute: ((Screen) -> Void)?
    
    init(model: WatchModel,
         repository: WatchRepositoryProtocol,
         animeDetailsRepository: AnimeDetailsRepositoryProtocol) {
        self.model = model
        self.watchRepository = repository
        self.animeDetailsRepository = animeDetailsRepository
    }
    
    func loadEpisode() async {
        
        guard state != .loaded && state != .loading else { return }
        
        state = .loading
        
        switch model.playerProvider {
        case .native(let episodeID):
            do {
                async let episodeTask =  watchRepository.fetchEpisode(id: episodeID)
                async let detailsTask = animeDetailsRepository.fetchAnimeDetails(id: model.animeID)
                
                let (fetchedEpisode, fetchedDetails) = try await (episodeTask, detailsTask)
                
                model.episode = fetchedEpisode
                model.seasons = fetchedDetails.seasons
                if let firstVideo = fetchedEpisode.videos.first {
                    selectedQuality = firstVideo.quality
                }
                qualities = fetchedEpisode.videos.map {$0.quality}
                
                breadcrumbs.append(BreadcrumbItem(screen: .animeDetails(animeID: model.animeID), title: model.title))
                breadcrumbs.append(BreadcrumbItem(screen: .watch(model: model), title: "Эпизод \(episode.number)"))
                
                if model.episode == nil {
                    state = .failed(NetworkError.emptyResponse)
                } else {
                    state = .loaded
                }
            } catch {
                state = .failed(error)
            }
        case .kodik(let titleID, let seasonNumber, let episodeNumber):
            // TODO: kodik
            break
        }
        
    }
    
    func didTapBreadcrumbItem(_ item: BreadcrumbItem) {
        onRoute?(item.screen)
    }
    
    func didSelectEpisode(episode: Episode, season: Season) {
        onRoute?(Screen.watch(model: WatchModel(animeID: episode.animeID, title: title, season: season.name, playerProvider: .native(episodeID: episode.id), seasons: seasons)))
    }
    
    func didTapCatalog() {
        onRoute?(Screen.home)
    }
}
