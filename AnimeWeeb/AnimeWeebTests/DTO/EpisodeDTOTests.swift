//
//  EpisodeDTOTests.swift
//  AnimeWeebTests
//
//  Created by Maksim Sazanovich
//

import Testing
import Foundation
@testable import AnimeWeeb

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
        #expect(result.episode == 10)
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
}
