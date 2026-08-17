//
//  TitleDTOTests.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Testing
@testable import AnimeWeeb
import Foundation

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
            dubbers: [])
    }
    
    @Test("Check mapping when valid DTO")
    func testToDomainReturnsAnimeModelWhenValidDTO()  {
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
        #expect(result.altNamesRu == [])
        #expect(result.altNamesEn == [
            "Super no Ura de Yani Suu Futari",
            "Smoking Behind the Supermarket with You"
        ])
    }
    
    @Test("Check mapping when invalid poster URL")
    func testToDomainReturnsAnimeModelWithNilImageURLWhenInvalidPosterURL()  {
        // Arrange
        let dto = makeDTO(posterURL: "", genreIDs: [1, 2])
        
        // Act
        let result = dto.toDomain()
        
        // Assert
        #expect(result.imageURL == nil)
    }
    
    @Test("Check filtering unknown genres")
    func testToDomainReturnsFilteredGenresWhenUnknownGenres()  {
        // Arrange
        let dto = makeDTO(genreIDs: [0, 1])
        
        // Act
        let result = dto.toDomain()
        
        // Assert
        #expect(result.genres.count == 1)
        #expect(result.genres == [.shounen])
    }
}
