//
//  WatchHistoryView.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct WatchHistoryView: View {

    let watchHistory: [WatchHistoryItem]

    var body: some View {
        VStack(alignment: .leading) {
            Text("История просмотра")
                .font(.system(.title, weight: .bold))
                .foregroundStyle(.largeTitle)

            VStack {
                ForEach(watchHistory) { model in
                    WatchHistoryCard(model: model) {
                        // TODO: Navigation
                        print("Navigation to episode with timecode")
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
