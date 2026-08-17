//
//  VideoDTOTests.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Testing
@testable import AnimeWeeb
import Foundation

struct VideoDTOTests {
    
    func makeDTO(url: String = "https://cache.libria.fun/videos/media/ts/824/1/720/9bbf5a695f1c4528a6ba014dd0dc2564.m3u8?countryIso=NL&isAuthorized=0&isWithVideoAds=1&isWithVideoAdsAlways=1") -> VideoDTO {
        return VideoDTO(id: 5941, dubberID: 1, dubberName: "AniLibria", dubberLanguage: "ru", videoFormatID: 1, videoFormat: "m3u8", resolution: "m3u8", url: url)
    }

    @Test("Valid DTO")
    func testToDomainReturnsVideoWhenValidDTO()  {
        // Arrange
        let dto = makeDTO()
        
        // Act
        let result = dto.toDomain()
        
        // Assert
        #expect(result.dubberName == "AniLibria")
        #expect(result.resolution == "m3u8")
        #expect(result.url == URL(string: "https://cache.libria.fun/videos/media/ts/824/1/720/9bbf5a695f1c4528a6ba014dd0dc2564.m3u8?countryIso=NL&isAuthorized=0&isWithVideoAds=1&isWithVideoAdsAlways=1"))
    }
    
    @Test("Invalid URL")
    func testToDomainReturnsNilWhenURLEmpty()  {
        let dto = makeDTO(url: "")
        
        let result = dto.toDomain()
        
        #expect(result.url == nil)
    }

    private func makeJSON(dubberID: String = "1") -> String {
        """
        {
            "id": 5941,
            "dubberId": \(dubberID),
            "dubberName": "AniLibria",
            "dubberLanguage": "ru",
            "videoFormatId": 1,
            "videoFormat": "m3u8",
            "resolution": "m3u8",
            "url": "https://example.com/video.m3u8"
        }
        """
    }
    
    @Test("Decodes from JSON")
    func testDecodingFromValidJSON() throws {
        // Act
        let dto = try JSONDecoder().decode(VideoDTO.self, from: Data(makeJSON().utf8))
        
        // Assert
        #expect(dto.id == 5941)
        #expect(dto.dubberID == 1)
        #expect(dto.dubberName == "AniLibria")
        #expect(dto.dubberLanguage == "ru")
        #expect(dto.videoFormatID == 1)
        #expect(dto.url == "https://example.com/video.m3u8")
    }
    
    @Test("Decodes then maps to domain")
    func testDecodingThenToDomainReturnsVideo() throws {
        // Act
        let dto = try JSONDecoder().decode(VideoDTO.self, from: Data(makeJSON().utf8))
        let result = dto.toDomain()
        
        // Assert
        #expect(result.dubberName == "AniLibria")
        #expect(result.resolution == "m3u8")
        #expect(result.url == URL(string: "https://example.com/video.m3u8"))
    }
    
    @Test("Fails when dubberId has wrong type")
    func testDecodingThrowsWhenDubberIDIsString() throws {
        // Assert
        #expect(throws: DecodingError.self) {
            try JSONDecoder().decode(VideoDTO.self, from: Data(makeJSON(dubberID: "\"one\"").utf8))
        }
    }

}
