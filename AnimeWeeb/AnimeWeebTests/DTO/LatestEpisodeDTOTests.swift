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
    
    private func makeJSON(includeEpisodeID: Bool = true) -> String {
        let episodeIDLine = includeEpisodeID ? "\"episodeId\": 100," : ""
        return """
        {
            \(episodeIDLine)
            "titleId": 42,
            "titleNameRu": "История о перекуре за супермаркетом",
            "titleNameEn": "Behind the Supermarket, Smoking with You.",
            "posterUrl": "https://example.com/poster.jpg",
            "seasonNumber": 1,
            "seasonName": "Сезон 1",
            "episodeNumber": 5,
            "episodeIndex": 5,
            "createdAt": "2026-08-17",
            "titleObj": {
                "id": 1102,
                "nameRu": "История о перекуре за супермаркетом",
                "nameEn": "Behind the Supermarket, Smoking with You.",
                "nameJp": "スーパーの裏でヤニ吸うふたり",
                "altNamesRu": [],
                "altNamesEn": ["Smoking Behind the Supermarket with You"],
                "description": "Нет описания",
                "posterUrl": "https://example.com/poster.jpg",
                "rating": 3,
                "status": "Ongoing",
                "createdAt": "2026-06-12T12:13:11.0999497",
                "genres": [],
                "dubbers": []
            },
            "seasonObj": {
                "id": 1,
                "titleId": 42,
                "name": "Сезон 1",
                "seasonName": "1-сезон",
                "seasonNumber": 1,
                "sortOrder": 1,
                "type": "TV",
                "episodesCount": 12,
                "releaseDate": "с 3 июня 2026 г.",
                "status": "Ongoing",
                "description": "Нет описания",
                "episodes": [],
                "shikimoriId": "62076"
            },
            "episodeObj": {
                "id": 101,
                "seasonId": 1,
                "titleId": 42,
                "episodeNumber": 15,
                "numberInSeason": 1,
                "videos": [],
                "subtitleTracks": [],
                "playback": {
                    "defaultMode": "standard",
                    "standardEnabled": true,
                    "learningEnabled": false
                }
            }
        }
        """
    }
    
    @Test("Decodes from JSON with nested objects")
    func testDecodingFromValidJSON() throws {
        // Act
        let dto = try JSONDecoder().decode(LatestEpisodeDTO.self, from: Data(makeJSON().utf8))
        
        // Assert
        #expect(dto.episodeID == 100)
        #expect(dto.titleID == 42)
        #expect(dto.posterURL == "https://example.com/poster.jpg")
        #expect(dto.titleObj.id == 1102)
        #expect(dto.titleObj.status == .ongoing)
        #expect(dto.seasonObj.titleID == 42)
        #expect(dto.seasonObj.type == .tv)
        #expect(dto.episodeObj.seasonID == 1)
        #expect(dto.episodeObj.playback.defaultMode == .standard)
    }
    
    @Test("Decodes then maps to domain")
    func testDecodingThenToDomainReturnsNewReleasesAnimeModel() throws {
        // Act
        let dto = try JSONDecoder().decode(LatestEpisodeDTO.self, from: Data(makeJSON().utf8))
        let result = dto.toDomain()
        
        // Assert
        #expect(result.titleID == 42)
        #expect(result.title == "История о перекуре за супермаркетом")
        #expect(result.season == 1)
        #expect(result.seasonName == "Сезон 1")
        #expect(result.episode == 5)
        #expect(result.episodeID == 100)
        #expect(result.format == .tv)
        #expect(result.imageURL == URL(string: "https://example.com/poster.jpg"))
    }
    
    @Test("Fails when required field missing")
    func testDecodingThrowsWhenEpisodeIDMissing() throws {
        // Assert
        #expect(throws: DecodingError.self) {
            try JSONDecoder().decode(LatestEpisodeDTO.self, from: Data(makeJSON(includeEpisodeID: false).utf8))
        }
    }
}
