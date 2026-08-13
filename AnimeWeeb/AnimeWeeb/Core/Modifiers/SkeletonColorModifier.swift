//
//  SkeletonColorModifier.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct SkeletonColorModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white.opacity(0.3))
    }
}

extension View {
    func skeletonColor() -> some View {
        self.modifier(SkeletonColorModifier())
    }
}
