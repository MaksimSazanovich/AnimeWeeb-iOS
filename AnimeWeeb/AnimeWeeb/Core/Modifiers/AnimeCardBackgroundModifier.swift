//
//  AnimeCardBackgroundModifier.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct AnimeCardBackgroundModifier: ViewModifier {
    
    var cornerRadius: CGFloat = 12
    var fillOpacity: CGFloat = 0.4
    var strokeOpacity: CGFloat = 0.9
    
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(.viewBackground.opacity(fillOpacity))
            )
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .strokeBorder(.stroke.opacity(strokeOpacity), lineWidth: 1)
            )
    }
}

extension View {
    func animeCardBackgroundModifier(cornerRadius: CGFloat = 12, fillOpacity: CGFloat = 0.4, strokeOpacity: CGFloat = 0.9) -> some View {
        modifier(AnimeCardBackgroundModifier(cornerRadius: cornerRadius, fillOpacity: fillOpacity, strokeOpacity: strokeOpacity))
    }
}
