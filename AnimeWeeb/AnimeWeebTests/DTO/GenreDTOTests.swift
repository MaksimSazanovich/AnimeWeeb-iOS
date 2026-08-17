//
//  GenreDTOTests.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

@testable import AnimeWeeb
import Testing

struct GenreDTOTests {

    @Test("Valid ID", arguments: [
        (1, Genre.shounen),
        (2, Genre.adventure),
        (3, Genre.drama),
        (4, Genre.fantasy),
        (5, Genre.suspense),
        (6, Genre.action),
        (7, Genre.comedy),
        (8, Genre.seinen),
        (9, Genre.mystery),
        (10, Genre.supernatural),
        (11, Genre.romance),
        (12, Genre.shoujo),
        (13, Genre.sciFi),
        (14, Genre.horror),
        (15, Genre.sports),
        (16, Genre.gourmet),
        (17, Genre.sliceOfLife)
    ]) func testToDomainReturnsGenreWhenValidID(id: Int, expectedGenre: Genre) {
        // Arrange
        let dto = GenreDTO(id: id, nameRu: "Тест", nameEn: "Test")

        // Act
        let result = dto.toDomain()

        // Assert
        #expect(result == expectedGenre)
    }

    @Test("Invalid ID", arguments: [-1, 0, 100])
    func testToDomainReturnsNilWhenInvalidID(id: Int) {
        // Arrange
        let dto = GenreDTO(id: id, nameRu: "Тест", nameEn: "Test")

        // Act
        let result = dto.toDomain()

        // Assert
        #expect(result == nil)
    }

}
