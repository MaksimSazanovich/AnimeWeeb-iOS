//
//  SocialMedia.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

enum SocialMedia: String, Identifiable, CaseIterable {
    var id : Self { self }
    
    case tikTok = "TikTok"
    case instagram = "Instagram"
    case patreon = "Patreon"
    case telegram = "Telegram"
    
    var image: String {
        switch self {
        case .tikTok: return "tiktok.fill"
        case .instagram: return "instagram"
        case .patreon: return "patreon.fill"
        case .telegram: return "telegram-2.fill"
        }
    }
}
