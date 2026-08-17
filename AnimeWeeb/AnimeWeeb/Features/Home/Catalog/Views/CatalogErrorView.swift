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
        ErrorView(title: "Не удалось загрузить каталог.", buttonTitle: "Повторить", onRetry: onRetry)
    }
}

#Preview {
    CatalogErrorView(onRetry: {})
}

