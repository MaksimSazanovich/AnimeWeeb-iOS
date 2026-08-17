//
//  CatalogProgressView.swift
//  AnimeWeeb
//
//  Created based on Canopas (MIT License)
//  https://github.com/canopas/swiftui-animations-examples
//

import SwiftUI

struct CatalogProgressView: View {
    @State private var isAnimating = false

    private let dotSize: CGFloat = 8
    private let jumpHeight: CGFloat = -6

    var body: some View {
        HStack(spacing: 6) {
            ForEach(0..<3) { index in
                Circle()
                    .fill(.seasonBadge)
                    .frame(width: dotSize, height: dotSize)
                    .offset(y: isAnimating ? jumpHeight : 0)
                    .animation(
                        Animation
                            .easeInOut(duration: 0.45)
                            .repeatForever(autoreverses: true)
                            .delay(Double(index) * 0.15),
                        value: isAnimating
                    )
            }
        }
        .padding(.vertical, 8)
        .onAppear {
            isAnimating = true
        }
    }
}

#Preview {
    CatalogProgressView()
}
