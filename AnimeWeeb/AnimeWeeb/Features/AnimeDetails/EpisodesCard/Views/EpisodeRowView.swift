//
//  EpisodeRowView.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct EpisodeRowView: View {
    
    let episode: Episode
    
    var body: some View {
        HStack {
            Text("\(episode.episode)")
                .font(.system(.caption, weight: .semibold))
                .foregroundStyle(.subtitle)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .fill(.stroke)
                        .frame(width: 28, height: 28)
                )
            
            Text("Эпизод \(episode.episode)")
                .font(.system(.body, weight: .medium))
                .foregroundStyle(.menuIcon)
        }
        .frame(alignment: .leading)
    }
}
