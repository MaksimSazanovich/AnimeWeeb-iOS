//
//  SkeletonHomeContentView.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Shimmer
import SwiftUI

struct SkeletonHomeContentView: View {

    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        ScrollView {
            ScrollViewReader { _ in
                VStack(alignment: .leading) {

                    // MARK: - New Releases
                    VStack(alignment: .leading, spacing: 24) {
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .frame(height: 36)
                            .skeletonColor()

                        VStack(spacing: 30) {
                            // MARK: New Releases ScrollView
                            ScrollView(.horizontal) {
                                LazyHStack(spacing: 16) {
                                    ForEach(0...5, id: \.self) { _ in
                                        SkeletonAnimeCard()
                                            .frame(width: 150)
                                    }
                                }
                                .padding(.bottom, 30)
                            }

                        }
                    }

                    // MARK: - Catalog
                    VStack(alignment: .leading, spacing: 32) {

                        VStack(alignment: .leading, spacing: 16) {

                            VStack(alignment: .leading, spacing: 8) {

                                // MARK: Catalog Title
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    .skeletonColor()
                                    .frame(width: 120, height: 36)

                                // MARK: Catalog Subtitle
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    .skeletonColor()
                                    .frame(width: 230, height: 20)
                            }

                            VStack(alignment: .leading, spacing: 12) {
                                // MARK: Search Bar
                                RoundedRectangle(cornerRadius: 12)
                                    .skeletonColor()
                                    .frame(height: 42)

                                // MARK: Genre Selector
                                RoundedRectangle(cornerRadius: 12)
                                    .skeletonColor()
                                    .frame(width: 200, height: 42)
                            }

                            // MARK: Anime Grid
                            LazyVGrid(columns: columns, spacing: 16) {
                                ForEach(0...5, id: \.self) { _ in
                                    SkeletonAnimeCard()
                                }
                            }

                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .shimmering()
            }
        }
    }
}

#Preview {
    SkeletonHomeContentView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
}
