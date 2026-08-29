//
//  SkeletonWatchHistory.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Shimmer
import SwiftUI

struct SkeletonWatchHistory: View {
    var body: some View {
        VStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .frame(width: 190, height: 36)
                .skeletonColor()

            LazyVStack {
                ForEach(0...3, id: \.self) { _ in
                    RoundedRectangle(cornerRadius: 16)
                        .frame(height: 128)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .skeletonColor()
                }
            }
        }
        .shimmering()
    }
}

#Preview {
    ZStack {
        SkeletonWatchHistory()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .padding()
    .padding(.horizontal)
    .background(Color.background)
}
