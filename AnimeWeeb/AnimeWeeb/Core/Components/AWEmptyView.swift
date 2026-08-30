//
//  AWEmptyView.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct AWEmptyView: View {
    let title: String
    let buttonTitle: String?

    var onAction: (() -> Void)?

    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.body)
                .foregroundStyle(.genreText)
                .minimumScaleFactor(0.75)
                .multilineTextAlignment(.center)

            if let buttonTitle = buttonTitle, let onAction = onAction {
                Button {
                    onAction()
                } label: {
                    Text(buttonTitle)
                        .font(.system(.body, weight: .semibold))
                        .foregroundStyle(.purpleBackground)
                        .lineLimit(1)
                        .minimumScaleFactor(0.75)
                        .multilineTextAlignment(.center)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .padding(.vertical)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.viewBackground.opacity(0.4))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(.stroke.opacity(0.9), style: StrokeStyle(lineWidth: 2, dash: [4, 4]))
        )
    }

    init(title: String, buttonTitle: String? = nil, onAction: (() -> Void)? = nil) {
        self.title = title
        self.buttonTitle = buttonTitle
        self.onAction = onAction
    }
}

#Preview {
    AWEmptyView(title: "История просмотров пока отсутствует. Начните просмотр, чтобы отслеживать свой прогресс здесь!", buttonTitle: "Просмотреть каталог") {

    }
}
