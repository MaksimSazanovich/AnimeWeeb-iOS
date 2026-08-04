//
//  AnimeSearchBar.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct AnimeSearchBar: View {
    
    @Binding var searchTerm: String
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack(spacing: 13) {
            Image(systemName: "magnifyingglass")
                .font(.system(.body, weight: .semibold))
                .foregroundStyle(.gray)
            
            TextField("Поиск по RU, EN, JP или алиасам...", text: $searchTerm)
                .focused($isFocused)
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
                .strokeBorder(isFocused ? .focusedStroke : .stroke, lineWidth: 1)
                
        }
        .padding(2)
        .overlay {
            RoundedRectangle(cornerRadius: 13)
                .strokeBorder(isFocused ? .focusedSecondStroke : .clear, lineWidth: 2)
        }
        
    }
}
