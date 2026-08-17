//
//  ErrorView.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct ErrorView: View {
    let title: String
    let buttonTitle: String
    
    var onRetry: () -> Void
    
    var body: some View {
        HStack {
            Text(title)
                .font(.body)
                .foregroundStyle(.errorText)
                .lineLimit(1)
                .minimumScaleFactor(0.75)
           
            Button {
                onRetry()
            } label: {
                Text(buttonTitle)
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
