//
//  GenreDTOTests.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

@testable import AnimeWeeb
import Testing

struct GenreDTOTests {

    private static let validGenreCases: [(Int, Genre)] = [
            (0, .all),
            (1, .shounen),
            (2, .adventure),
            (3, .drama),
            (4, .fantasy),
            (5, .suspense),
            (6, .action),
            (7, .comedy),
            (8, .seinen),
            (9, .mystery),
            (10, .supernatural),
            (11, .romance),
            (12, .shoujo),
            (13, .sciFi),
            (14, .horror),
            (15, .sports),
            (16, .gourmet),
            (17, .sliceOfLife)
        ]

    @Test("Valid ID", arguments: validGenreCases) func testToDomainReturnsGenreWhenValidID(id: Int, expectedGenre: Genre) {
        // Arrange
        let dto = GenreDTO(id: id, nameRu: "Тест", nameEn: "Test")

        // Act
        let result = dto.toDomain()

        // Assert
        #expect(result == expectedGenre)
    }

    @Test("Invalid ID", arguments: [-1, 100])
    func testToDomainReturnsNilWhenInvalidID(id: Int) {
        // Arrange
        let dto = GenreDTO(id: id, nameRu: "Тест", nameEn: "Test")

        // Act
        let result = dto.toDomain()

        // Assert
        #expect(result == nil)
    }

}
