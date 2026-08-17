//
//  TypeDTOTests.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

@testable import AnimeWeeb
import Testing

struct TypeDTOTests {

    @Test("Valid DTO", arguments: [
        (TypeDTO.tv, AnimeFormat.tv)
    ])
    func testToDomainReturnsAnimeFormatWhenValidDTO(dto: TypeDTO, expected: AnimeFormat) {
        // Act
        let result = dto.toDomain()

        // Assert
        #expect(result == expected)
    }

}
