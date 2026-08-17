//
//  DefaultModeDTOTests.swift
//  AnimeWeebTests
//
//  Created by Maksim Sazanovich
//

import Testing
import Foundation
@testable import AnimeWeeb

struct DefaultModeDTOTests {

    @Test("Decodes standard mode")
    func testDecodingStandard() throws {
        // Act
        let dto = try JSONDecoder().decode(DefaultModeDTO.self, from: Data("\"standard\"".utf8))

        // Assert
        #expect(dto == .standard)
    }

    @Test("Fails on unknown mode")
    func testDecodingThrowsWhenUnknown() throws {
        // Assert
        #expect(throws: DecodingError.self) {
            try JSONDecoder().decode(DefaultModeDTO.self, from: Data("\"learning\"".utf8))
        }
    }
}
