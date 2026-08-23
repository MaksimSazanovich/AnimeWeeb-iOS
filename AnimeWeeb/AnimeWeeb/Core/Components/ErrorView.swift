//
//  ErrorView.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct ErrorView: View {
    let title: String
    var buttonTitle: String?

    var onRetry: (() -> Void)?

    var body: some View {
        HStack {
            Text(title)
                .font(.body)
                .foregroundStyle(.errorText)
                .minimumScaleFactor(0.75)

            if let buttonTitle = buttonTitle, let onRetry = onRetry {
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
        }
        .frame(maxWidth: .infinity)
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
    
    init(title: String, buttonTitle: String? = nil, onRetry: (() -> Void)? = nil) {
        self.title = title
        self.buttonTitle = buttonTitle
        self.onRetry = onRetry
    }
}
