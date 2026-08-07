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
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(isTextFieldFocused ? .focusedStroke : .stroke, lineWidth: 1)
                
        }
        .padding(2)
        .overlay {
            RoundedRectangle(cornerRadius: 13)
                .strokeBorder(isTextFieldFocused ? .focusedSecondStroke : .clear, lineWidth: 2)
        }
        .onChange(of: isTextFieldFocused) { _, newValue in
            isFocused = isTextFieldFocused
        }
        .onChange(of: isFocused) { _, newValue in
            isTextFieldFocused = isFocused
        }
    }
}
