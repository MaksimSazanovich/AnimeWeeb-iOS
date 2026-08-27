//
//  CatalogErrorView.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct CatalogErrorView: View {

    var onRetry: () -> Void

    var body: some View {
        AWErrorView(title: "Не удалось загрузить каталог.", buttonTitle: "Повторить", onRetry: onRetry)
            .lineLimit(1)
    }
}

#Preview {
    CatalogErrorView(onRetry: {})
}
