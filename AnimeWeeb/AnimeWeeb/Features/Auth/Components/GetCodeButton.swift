//
//  GetCodeButton.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct GetCodeButton: View {

    var onAction: () -> Void

    var body: some View {
        Button {
            onAction()
        } label: {
            Text("Получить код")
                .font(.system(.body, weight: .semibold))
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.purpleBackground)
                )
        }
    }
}
