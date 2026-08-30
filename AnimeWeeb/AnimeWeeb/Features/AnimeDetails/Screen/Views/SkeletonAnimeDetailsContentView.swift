//
//  SkeletonAnimeDetailsContentView.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Shimmer
import SwiftUI

struct SkeletonAnimeDetailsContentView: View {

    var body: some View {

        ScrollView {
            VStack(spacing: 32) {
                // MARK: Image
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 320, height: 480)
                    .skeletonColor()
                    .padding(.horizontal)
                    .shimmering()

                VStack(alignment: .leading, spacing: 12) {
                    // MARK: Title
                    RoundedRectangle(cornerRadius: 7, style: .continuous)
                        .skeletonColor()
                        .frame(maxWidth: .infinity, minHeight: 36)

                    // MARK: Tag Cloud
                    HStack {
                        ForEach(0...2, id: \.self) { _ in
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 80, height: 24)
                                .skeletonColor()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    // MARK: Description
                    RoundedRectangle(cornerRadius: 7, style: .continuous)
                        .skeletonColor()
                        .frame(maxWidth: .infinity, minHeight: 24)

                    RoundedRectangle(cornerRadius: 7, style: .continuous)
                        .skeletonColor()
                        .frame(maxWidth: .infinity, minHeight: 24)
                        .padding(.trailing, 30)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 50)
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
        .shimmering()
    }
}

#Preview {
    SkeletonAnimeDetailsContentView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
}
