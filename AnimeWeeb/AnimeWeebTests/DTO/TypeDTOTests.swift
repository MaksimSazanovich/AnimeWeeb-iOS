//
//  TypeDTOTests.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Testing
@testable import AnimeWeeb

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
