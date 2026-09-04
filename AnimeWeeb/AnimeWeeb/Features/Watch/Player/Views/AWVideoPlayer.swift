//
//  AWVideoPlayer.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI
import AVKit

struct AWVideoPlayer: UIViewControllerRepresentable {
    
    let url: URL
    var startTime: Double = 0
    var onTimeUpdate: ((Double) -> Void)? = nil
    
    func makeCoordinator() -> PlayerTimeObserver {
        PlayerTimeObserver(self)
    }
    
    func makeUIViewController(context: Context) -> some AVPlayerViewController {
        let controller = AVPlayerViewController()
        
        let player = AVPlayer(url: url)
        
        if startTime > 0 {
            let targetTime = CMTime(seconds: startTime, preferredTimescale: 600)
            player.seek(to: targetTime)
        }
        
        controller.player = player
        controller.showsPlaybackControls = true
        controller.videoGravity = .resizeAspect
        
        context.coordinator.setupTimeObserver(for: player)
        
        player.play()
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
        guard let currentItem = uiViewController.player?.currentItem,
              let currentURLAsset = currentItem.asset as? AVURLAsset,
              currentURLAsset.url != url else { return }
        
        let currentTime = uiViewController.player?.currentTime() ?? .zero
        
        let newPlayerItem = AVPlayerItem(url: url)
        uiViewController.player?.replaceCurrentItem(with: newPlayerItem)
        
        uiViewController.player?.seek(to: currentTime) { _ in
            uiViewController.player?.play()
        }
    }
}
