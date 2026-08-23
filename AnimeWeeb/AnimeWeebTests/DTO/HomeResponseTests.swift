//
//  HomeResponseTests.swift
//  AnimeWeebTests
//
//  Created by Maksim Sazanovich
//

@testable import AnimeWeeb
import Foundation
import Testing

struct HomeResponseTests {

    private func makeJSON(
        latestEpisodes: String = "[]",
        titles: String = "[]",
        totalTitles: Int = 61
    ) -> String {
        """
        {
            "latestEpisodes": \(latestEpisodes),
            "titles": \(titles),
            "totalTitles": \(totalTitles)
        }
        """
    }

    @Test("Decodes from JSON")
    func testDecodingFromValidJSON() throws {
        // Arrange
        let titleJSON = """
        {"id": 1, "nameRu": "Название", "nameEn": "Title", "nameJp": "タイトル", "altNamesRu": [], "altNamesEn": [], "description": "Описание", "posterUrl": "https://example.com/poster.jpg", "rating": 7, "status": "Ongoing", "createdAt": "2026-01-01", "genres": [], "dubbers": []}
        """

        // Act
        let dto = try JSONDecoder().decode(HomeResponse.self, from: Data(makeJSON(titles: "[\(titleJSON)]").utf8))

        // Assert
        #expect(dto.totalTitles == 61)
        #expect(dto.titles.count == 1)
        #expect(dto.titles.first?.id == 1)
        #expect(dto.titles.first?.nameRu == "Название")
        #expect(dto.latestEpisodes.isEmpty)
    }

    @Test("Decodes empty lists and maps to empty domain model")
    func testDecodingEmptyThenToDomain() throws {
        // Act
        let dto = try JSONDecoder().decode(HomeResponse.self, from: Data(makeJSON().utf8))
        let result = dto.toDomain()

        // Assert
        #expect(result.newReleases.isEmpty)
        #expect(result.animes.isEmpty)
        #expect(result.totalAnimes == 61)
    }
}
