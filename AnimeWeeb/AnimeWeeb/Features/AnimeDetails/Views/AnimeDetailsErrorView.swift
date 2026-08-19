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
        ErrorView(title: "Тайтл не найдет или API недоступен.", buttonTitle: "В каталог", onRetry: onRetry)
    }
}

#Preview {
    AnimeDetailsErrorView(onRetry: {})
}
