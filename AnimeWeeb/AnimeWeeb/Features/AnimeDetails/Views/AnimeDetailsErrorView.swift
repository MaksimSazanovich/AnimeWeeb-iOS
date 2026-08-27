//
//  AnimeDetailsErrorView.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct AnimeDetailsErrorView: View {

    var onRetry: () -> Void

    var body: some View {
        AWErrorView(title: "Тайтл не найдет или API недоступен.", buttonTitle: "В каталог", onRetry: onRetry)
            .lineLimit(1)
    }
}

#Preview {
    AnimeDetailsErrorView(onRetry: {})
}
