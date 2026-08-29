//
//  TitleDTOTests.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

@testable import AnimeWeeb
import Foundation
import Testing

struct TitleDTOTests {

    private func makeDTO(posterURL: String = "https://shikimori.io/uploads/poster/animes/62076/main_alt-d79ac691463b536120322c6b2c89eba1.jpeg", genreIDs: [Int]) -> TitleDTO {
        return TitleDTO(
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
            genres: genreIDs.map { GenreDTO(id: $0, nameRu: "Genre", nameEn: "Genre") },
            dubbers: [], seasons: [])
    }

    @Test("Valid DTO")
    func testToDomainReturnsAnimeModelWhenValidDTO() {
        // Arrange
        let dto = makeDTO(genreIDs: [1, 2])

        // Act
        let result = dto.toDomain()

        // Assert
        #expect(result.id == 1102)
        #expect(result.title == "История о перекуре за супермаркетом")
        #expect(result.description == "Нет описания")
        #expect(result.imageURL == URL(string: "https://shikimori.io/uploads/poster/animes/62076/main_alt-d79ac691463b536120322c6b2c89eba1.jpeg"))
        #expect(result.genres.count == 2)
        #expect(result.genres == [.shounen, .adventure])
        #expect(result.nameEn == "Behind the Supermarket, Smoking with You.")
        #expect(result.nameJp == "スーパーの裏でヤニ吸うふたり")
        #expect(result.altNamesRu.isEmpty)
        #expect(result.altNamesEn == [
            "Super no Ura de Yani Suu Futari",
            "Smoking Behind the Supermarket with You"
        ])
    }

    @Test("Invalid poster URL")
    func testToDomainReturnsAnimeModelWithNilImageURLWhenInvalidPosterURL() {
        // Arrange
        let dto = makeDTO(posterURL: "", genreIDs: [1, 2])

        // Act
        let result = dto.toDomain()

        // Assert
        #expect(result.imageURL == nil)
    }

    @Test("Filtering unknown genres")
    func testToDomainReturnsFilteredGenresWhenUnknownGenres() {
        // Arrange
        let dto = makeDTO(genreIDs: [-1, 1])

        // Act
        let result = dto.toDomain()

        // Assert
        #expect(result.genres.count == 1)
        #expect(result.genres == [.shounen])
    }

    private func makeJSON(
        posterURL: String? = "https://example.com/poster.jpg",
        status: String = "Ongoing",
        genres: String = "[{\"id\": 1, \"nameRu\": \"Сёнэн\", \"nameEn\": \"Shounen\"}]"
    ) -> String {
        let posterLine = posterURL.map { "\"posterUrl\": \"\($0)\"," } ?? ""
        return """
        {
            "id": 1,
            "nameRu": "Название",
            "nameEn": "Title",
            "nameJp": "タイトル",
            "altNamesRu": [],
            "altNamesEn": [],
            "description": "Описание",
            \(posterLine)
            "rating": 7,
            "status": "\(status)",
            "createdAt": "2026-01-01",
            "genres": \(genres),
            "dubbers": []
        }
        """
    }

    @Test("Decodes from JSON")
    func testDecodingFromValidJSON() throws {
        // Act
        let dto = try JSONDecoder().decode(TitleDTO.self, from: Data(makeJSON().utf8))

        // Assert
        #expect(dto.id == 1)
        #expect(dto.nameRu == "Название")
        #expect(dto.posterURL == "https://example.com/poster.jpg")
        #expect(dto.status == .ongoing)
        #expect(dto.rating == 7)
        #expect(dto.genres.count == 1)
        #expect(dto.genres.first?.id == 1)
        #expect(dto.dubbers.isEmpty)
    }

    @Test("Decodes then maps to domain")
    func testDecodingThenToDomainReturnsAnimeModel() throws {
        // Act
        let dto = try JSONDecoder().decode(TitleDTO.self, from: Data(makeJSON().utf8))
        let result = dto.toDomain()

        // Assert
        #expect(result.id == 1)
        #expect(result.title == "Название")
        #expect(result.imageURL == URL(string: "https://example.com/poster.jpg"))
        #expect(result.genres == [.shounen])
    }

    @Test("Decodes empty genres and dubbers")
    func testDecodingWithEmptyCollections() throws {
        // Act
        let dto = try JSONDecoder().decode(TitleDTO.self, from: Data(makeJSON(genres: "[]").utf8))

        // Assert
        #expect(dto.genres.isEmpty)
        #expect(dto.dubbers.isEmpty)
    }

    @Test("Fails when required field missing")
    func testDecodingThrowsWhenPosterURLMissing() throws {
        // Assert
        #expect(throws: DecodingError.self) {
            try JSONDecoder().decode(TitleDTO.self, from: Data(makeJSON(posterURL: nil).utf8))
        }
    }

    @Test("Fails on unknown status")
    func testDecodingThrowsWhenStatusInvalid() throws {
        // Assert
        #expect(throws: DecodingError.self) {
            try JSONDecoder().decode(TitleDTO.self, from: Data(makeJSON(status: "Unknown").utf8))
        }
    }
}
