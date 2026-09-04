//
//  PlayerTimeObserver.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation
import AVFoundation

class PlayerTimeObserver: NSObject {
    var parent: AWVideoPlayer
    private var timeObserverToken: Any?
    
    init(_ parent: AWVideoPlayer) {
        self.parent = parent
    }
    
    func setupTimeObserver(for player: AVPlayer) {
        removeTimeObserver(from: player)
        
        let interval = CMTime(seconds: 1.0, preferredTimescale: 600)
        timeObserverToken = player.addPeriodicTimeObserver(forInterval: interval, queue: .main, using: { [weak self] time in
            let seconds = time.seconds
            guard seconds.isFinite, seconds >= 0 else { return }
            self?.parent.onTimeUpdate?(seconds)
        })
    }
    
    private func removeTimeObserver(from player: AVPlayer) {
        if let token = timeObserverToken {
            player.removeTimeObserver(token)
            timeObserverToken = nil
        }
    }
    
    deinit {
        timeObserverToken = nil
    }
}
