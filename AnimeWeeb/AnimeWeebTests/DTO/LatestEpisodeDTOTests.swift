//
//  LatestEpisodeDTOTests.swift
//  AnimeWeebTests
//
//  Created by Maksim Sazanovich
//

import Testing
import Foundation
@testable import AnimeWeeb

@MainActor
struct LatestEpisodeDTOTests {

    private func makeSeasonDTO(name: String = "Сезон 1", type: TypeDTO = .tv) -> SeasonDTO {
        SeasonDTO(
            id: 1,
            titleID: 1,
            name: name,
            seasonName: "1-сезон",
            seasonNumber: 1,
            sortOrder: 1,
            type: type,
            episodesCount: 12,
            releaseDate: "с 3 июня 2026 г.",
            status: StatusDTO.ongoing,
            description: "Нет описания",
            episodes: [],
            shikimoriID: "62076"
        )
    }

    private func makeDTO(
        posterURL: String = "https://example.com/poster.jpg",
        seasonObj: SeasonDTO? = nil
    ) -> LatestEpisodeDTO {
        LatestEpisodeDTO(
            episodeID: 100,
            titleID: 42,
            titleNameRu: "История о перекуре за супермаркетом",
            titleNameEn: "Behind the Supermarket, Smoking with You.",
            posterURL: posterURL,
            seasonNumber: 1,
            seasonName: "Сезон 1",
            episodeNumber: 5,
            episodeIndex: 5,
            createdAt: "2026-08-17",
            titleObj: TitleDTO(
                id: 1102,
                nameRu: "История о перекуре за супермаркетом",
                nameEn: "Behind the Supermarket, Smoking with You.",
                nameJp: "スーパーの裏でヤニ吸うふたり",
                altNamesRu: [],
                altNamesEn: [
                    "Super no Ura de Yani Suu Futari",
                    "Smoking Behind the Supermarket with You"
                ],
                description: "Нет описания",
                posterURL: posterURL,
                rating: 3,
                status: .ongoing,
                createdAt: "2026-06-12T12:13:11.0999497",
                genres: [],
                dubbers: []
            ),
            seasonObj: seasonObj ?? makeSeasonDTO(),
            episodeObj: EpisodeDTO(
                id: 101,
                seasonID: 1,
                titleID: 42,
                episodeNumber: 15,
                numberInSeason: 1,
                videos: [],
                subtitleTracks: [],
                playback: PlaybackDTO(defaultMode: DefaultModeDTO.standard, standardEnabled: true, learningEnabled: false)
            )
        )
    }

    @Test
    func toDomainReturnsNewReleasesAnimeModelWhenValidDTO() {
        // Arrange
        let seasonDTO = makeSeasonDTO(name: "Первый сезон", type: .tv)
        let dto = makeDTO(
            posterURL: "https://example.com/poster.jpg",
            seasonObj: seasonDTO
        )

        // Act
        let result = dto.toDomain()

        // Assert
        #expect(result.imageURL == URL(string: "https://example.com/poster.jpg"))
        #expect(result.titleID == 42)
        #expect(result.title == "История о перекуре за супермаркетом")
        #expect(result.season == 1)
        #expect(result.seasonName == "Первый сезон")
        #expect(result.episode == 5)
        #expect(result.episodeID == 100)
        #expect(result.format == .tv)
    }

    @Test
    func toDomainReturnsNilImageURLWhenInvalidPosterURL() {
        // Arrange
        let dto = makeDTO(posterURL: "")

        // Act
        let result = dto.toDomain()

        // Assert
        #expect(result.imageURL == nil)
    }
}
