//
//  AnimeCardBackgroundModifier.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct AnimeCardBackgroundModifier: ViewModifier {
    
    var cornerRadius: CGFloat = 12
    
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(.viewBackground.opacity(0.4))
            )
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .strokeBorder(.stroke.opacity(0.9), lineWidth: 1)
            )
    }
}

extension View {
    func animeCardBackgroundModifier(cornerRadius: CGFloat = 12) -> some View {
        modifier(AnimeCardBackgroundModifier(cornerRadius: cornerRadius))
    }
}
