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
        HStack {
            Text("Не удалось загрузить каталог.")
                .font(.body)
                .foregroundStyle(.errorText)
                .lineLimit(1)
                .minimumScaleFactor(0.75)
           
            Button {
                onRetry()
            } label: {
                Text("Повторить")
                    .underline()
                    .font(.body)
                    .foregroundStyle(.errorText)
                    .lineLimit(1)
                    .minimumScaleFactor(0.75)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.errorBackground)
        )
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(.errorStroke, lineWidth: 1)
        }
    }
}

#Preview {
    CatalogErrorView(onRetry: {})
}
