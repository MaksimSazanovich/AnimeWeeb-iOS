//
//  EpisodeRowView.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct EpisodeRowView: View {

    let episode: Episode
    @State var isSelected: Bool
    var onSelect: () -> Void

    var body: some View {
        Button {
            onSelect()
        } label: {
            HStack(spacing: 12) {
                ZStack {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(isSelected ? .focusedStroke.opacity(0.9) : .stroke)
                        .frame(width: 28, height: 28)

                    Text("\(episode.number)")
                        .font(.system(.caption, weight: .semibold))
                        .foregroundStyle(isSelected ? .white : .subtitle)
                }

                Text("Эпизод \(episode.number)")
                    .font(.system(.body, weight: .medium))
                    .foregroundStyle(.menuIcon)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(10)
            .padding(.horizontal, 5)
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(isSelected ? .focusedSecondStroke : .clear)
        )
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(isSelected ? .focusedStroke : .clear, lineWidth: 1)
        }

    }
}
