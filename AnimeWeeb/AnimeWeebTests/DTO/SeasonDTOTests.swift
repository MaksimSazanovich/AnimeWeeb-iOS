//
//  SeasonDTOTests.swift
//  AnimeWeebTests
//
//  Created by Maksim Sazanovich
//

@testable import AnimeWeeb
import Foundation
import Testing

struct SeasonDTOTests {

    private func makeJSON(
        type: String = "TV",
        status: String = "Ongoing",
        episodes: String = "[]"
    ) -> String {
        """
        {
            "id": 1,
            "titleId": 42,
            "name": "Сезон 1",
            "seasonName": "1-сезон",
            "seasonNumber": 1,
            "sortOrder": 1,
            "type": "\(type)",
            "episodesCount": 12,
            "releaseDate": "с 3 июня 2026 г.",
            "status": "\(status)",
            "description": "Нет описания",
            "episodes": \(episodes),
            "shikimoriId": "62076"
        }
        """
    }

    @Test("Decodes from JSON with custom coding keys")
    func testDecodingFromValidJSON() throws {
        // Act
        let dto = try JSONDecoder().decode(SeasonDTO.self, from: Data(makeJSON().utf8))

        // Assert
        #expect(dto.id == 1)
        #expect(dto.titleID == 42)
        #expect(dto.name == "Сезон 1")
        #expect(dto.seasonNumber == 1)
        #expect(dto.sortOrder == 1)
        #expect(dto.type == .tv)
        #expect(dto.status == .ongoing)
        #expect(dto.episodes.isEmpty)
        #expect(dto.shikimoriID == "62076")
    }

    @Test("Decodes nested episodes")
    func testDecodingWithEpisodes() throws {
        // Arrange
        let episodes = """
        [{"id": 101, "seasonId": 1, "titleId": 42, "episodeNumber": 15, "numberInSeason": 1, "videos": [], "subtitleTracks": [], "playback": {"defaultMode": "standard", "standardEnabled": true, "learningEnabled": false}}]
        """

        // Act
        let dto = try JSONDecoder().decode(SeasonDTO.self, from: Data(makeJSON(episodes: episodes).utf8))

        // Assert
        #expect(dto.episodes.count == 1)
        #expect(dto.episodes.first?.seasonID == 1)
        #expect(dto.episodes.first?.titleID == 42)
    }

    @Test("Fails on invalid type")
    func testDecodingThrowsWhenTypeInvalid() throws {
        // Assert
        #expect(throws: DecodingError.self) {
            try JSONDecoder().decode(SeasonDTO.self, from: Data(makeJSON(type: "Movie").utf8))
        }
    }

    @Test("Fails on invalid status")
    func testDecodingThrowsWhenStatusInvalid() throws {
        // Assert
        #expect(throws: DecodingError.self) {
            try JSONDecoder().decode(SeasonDTO.self, from: Data(makeJSON(status: "Unknown").utf8))
        }
    }
}
