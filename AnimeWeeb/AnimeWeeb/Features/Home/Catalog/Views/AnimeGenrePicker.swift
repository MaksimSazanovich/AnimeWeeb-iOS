//
//  AnimeGenrePicker.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct AnimeGenrePicker: View {

    @Binding var selectedGenre: Genre

    var body: some View {
        HStack {
            Text("Жанр:")
                .font(.system(.caption, weight: .medium))
                .foregroundStyle(.genreText)

            Picker("Все", selection: $selectedGenre) {
                ForEach(Genre.allCases) { genre in
                    Text(genre.title)
                        .tag(genre)

                }
            }
            .pickerStyle(.menu)
            .tint(Color.mainTitle)
            .lineLimit(1)
            .fixedSize(horizontal: true, vertical: false)
            .padding(.horizontal)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.viewBackground.opacity(0.6))
            )
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(.stroke, lineWidth: 1)

            }
        }
    }
}
