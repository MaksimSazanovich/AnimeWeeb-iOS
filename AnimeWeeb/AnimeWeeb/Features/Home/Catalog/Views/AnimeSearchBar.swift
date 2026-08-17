//
//  AnimeSearchBar.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct AnimeSearchBar: View {

    @Binding var searchTerm: String
    @Binding var isFocused: Bool

    @FocusState private var isTextFieldFocused: Bool

    var body: some View {
        HStack(spacing: 13) {
            Image(systemName: "magnifyingglass")
                .font(.system(.body, weight: .semibold))
                .foregroundStyle(.genreText)

            TextField("Поиск по RU, EN, JP или алиасам...", text: $searchTerm)
                .focused($isTextFieldFocused)
                .font(.subheadline)
        }
        .frame(height: 42)
        .padding(.horizontal)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.viewBackground.opacity(0.6))
        )
        .contentShape(Rectangle())
        .onTapGesture {
            isTextFieldFocused = true
        }
        .textFieldFocusModifier(isTextFieldFocused)
        .onChange(of: isTextFieldFocused) { _, _ in
            isFocused = isTextFieldFocused
        }
        .onChange(of: isFocused) { _, _ in
            isTextFieldFocused = isFocused
        }
    }
}
