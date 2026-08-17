//
//  PlaybackDTOTests.swift
//  AnimeWeebTests
//
//  Created by Maksim Sazanovich
//

import Testing
import Foundation
@testable import AnimeWeeb

struct PlaybackDTOTests {

    private func makeJSON(standardEnabled: Bool = true, learningEnabled: Bool = false) -> String {
        """
        {
            "defaultMode": "standard",
            "standardEnabled": \(standardEnabled),
            "learningEnabled": \(learningEnabled)
        }
        """
    }

    @Test("Decodes from JSON")
    func testDecodingFromValidJSON() throws {
        // Act
        let dto = try JSONDecoder().decode(PlaybackDTO.self, from: Data(makeJSON().utf8))

        // Assert
        #expect(dto.defaultMode == .standard)
        #expect(dto.standardEnabled == true)
        #expect(dto.learningEnabled == false)
    }

    @Test("Decodes flags")
    func testDecodingFlags() throws {
        // Act
        let dto = try JSONDecoder().decode(PlaybackDTO.self, from: Data(makeJSON(standardEnabled: false, learningEnabled: true).utf8))

        // Assert
        #expect(dto.standardEnabled == false)
        #expect(dto.learningEnabled == true)
    }
}
