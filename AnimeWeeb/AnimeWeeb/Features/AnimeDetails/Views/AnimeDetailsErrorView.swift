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
        ErrorView(title: "Не удалось загрузить тайтл.", buttonTitle: "Повторить", onRetry: onRetry)
    }
}

#Preview {
    AnimeDetailsErrorView(onRetry: {})
}
