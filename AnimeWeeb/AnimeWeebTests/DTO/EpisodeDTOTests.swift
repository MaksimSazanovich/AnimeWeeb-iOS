//
//  EpisodeDTOTests.swift
//  AnimeWeebTests
//
//  Created by Maksim Sazanovich
//

@testable import AnimeWeeb
import Foundation
import Testing

struct EpisodeDTOTests {

    private func makeDTO(
        seasonID: Int = 1,
        numberInSeason: Int = 5,
        videos: [VideoDTO] = []
    ) -> EpisodeDTO {
        EpisodeDTO(
            id: 101,
            seasonID: seasonID,
            titleID: 42,
            episodeNumber: 15,
            numberInSeason: numberInSeason,
            videos: videos,
            subtitleTracks: [],
            playback: PlaybackDTO(defaultMode: DefaultModeDTO.standard, standardEnabled: true, learningEnabled: false)
        )
    }

    private func makeVideoDTO(dubberName: String = "AniDUB") -> VideoDTO {
        VideoDTO(
            id: 1,
            dubberID: 10,
            dubberName: dubberName,
            dubberLanguage: "ru",
            videoFormatID: 2,
            videoFormat: "HLS",
            resolution: "1080p",
            url: "https://example.com/video.m3u8"
        )
    }

    @Test("Valid DTO")
    func toDomainReturnsEpisodeWhenValidDTO() {
        // Arrange
        let videoDTO = makeVideoDTO(dubberName: "AniDUB")
        let dto = makeDTO(seasonID: 2, numberInSeason: 10, videos: [videoDTO])

        // Act
        let result = dto.toDomain()

        // Assert
        #expect(result.seasonID == 2)
        #expect(result.number == 10)
        #expect(result.videos.count == 1)
        #expect(result.videos.first?.dubberName == "AniDUB")
    }

    @Test("Empty videos")
    func toDomainReturnsEmptyVideosWhenVideosListIsEmpty() {
        // Arrange
        let dto = makeDTO(videos: [])

        // Act
        let result = dto.toDomain()

        // Assert
        #expect(result.videos.isEmpty)
    }

    private func makeJSON(
        videos: String = "[{\"id\": 1, \"dubberId\": 10, \"dubberName\": \"AniDUB\", \"dubberLanguage\": \"ru\", \"videoFormatId\": 2, \"videoFormat\": \"HLS\", \"resolution\": \"1080p\", \"url\": \"https://example.com/video.m3u8\"}]",
        defaultMode: String = "standard"
    ) -> String {
        return """
        {
            "id": 101,
            "seasonId": 2,
            "titleId": 42,
            "episodeNumber": 15,
            "numberInSeason": 10,
            "videos": \(videos),
            "subtitleTracks": [],
            "playback": {
                "defaultMode": "\(defaultMode)",
                "standardEnabled": true,
                "learningEnabled": false
            }
        }
        """
    }

    @Test("Decodes from JSON")
    func testDecodingFromValidJSON() throws {
        // Act
        let dto = try JSONDecoder().decode(EpisodeDTO.self, from: Data(makeJSON().utf8))

        // Assert
        #expect(dto.id == 101)
        #expect(dto.seasonID == 2)
        #expect(dto.titleID == 42)
        #expect(dto.numberInSeason == 10)
        #expect(dto.videos.count == 1)
        #expect(dto.videos.first?.dubberName == "AniDUB")
        #expect(dto.subtitleTracks.isEmpty)
        #expect(dto.playback.defaultMode == .standard)
        #expect(dto.playback.standardEnabled == true)
        #expect(dto.playback.learningEnabled == false)
    }

    @Test("Decodes then maps to domain")
    func testDecodingThenToDomainReturnsEpisode() throws {
        // Act
        let dto = try JSONDecoder().decode(EpisodeDTO.self, from: Data(makeJSON().utf8))
        let result = dto.toDomain()

        // Assert
        #expect(result.seasonID == 2)
        #expect(result.number == 10)
        #expect(result.videos.count == 1)
        #expect(result.videos.first?.dubberName == "AniDUB")
    }

    @Test("Decodes empty videos")
    func testDecodingWithEmptyVideos() throws {
        // Act
        let dto = try JSONDecoder().decode(EpisodeDTO.self, from: Data(makeJSON(videos: "[]").utf8))

        // Assert
        #expect(dto.videos.isEmpty)
    }

    @Test("Fails on invalid defaultMode")
    func testDecodingThrowsWhenDefaultModeInvalid() throws {
        // Assert
        #expect(throws: DecodingError.self) {
            try JSONDecoder().decode(EpisodeDTO.self, from: Data(makeJSON(defaultMode: "learning").utf8))
        }
    }
}
