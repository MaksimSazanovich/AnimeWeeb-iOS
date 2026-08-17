//
//  StatusDTOTests.swift
//  AnimeWeebTests
//
//  Created by Maksim Sazanovich
//

import Testing
import Foundation
@testable import AnimeWeeb

struct StatusDTOTests {

    @Test("Decodes valid statuses", arguments: [
        ("Finished", StatusDTO.finished),
        ("New", StatusDTO.new),
        ("Ongoing", StatusDTO.ongoing)
    ])
    func testDecodingValidStatuses(rawValue: String, expected: StatusDTO) throws {
        // Act
        let dto = try JSONDecoder().decode(StatusDTO.self, from: Data("\"\(rawValue)\"".utf8))

        // Assert
        #expect(dto == expected)
    }

    @Test("Fails on unknown status")
    func testDecodingThrowsWhenUnknown() throws {
        // Assert
        #expect(throws: DecodingError.self) {
            try JSONDecoder().decode(StatusDTO.self, from: Data("\"Unknown\"".utf8))
        }
    }
}
