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

}
