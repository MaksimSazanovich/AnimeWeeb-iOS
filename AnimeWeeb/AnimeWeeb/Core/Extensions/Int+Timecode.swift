//
//  Int+Timecode.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

extension Int {
    var timecode: String {
        let hours = self / 3600
        let minutes = (self % 3600) / 60
        let seconds = self % 60

        if hours > 0 {
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        } else {
            return String(format: "%02d:%02d", minutes, seconds)
        }
    }
}
