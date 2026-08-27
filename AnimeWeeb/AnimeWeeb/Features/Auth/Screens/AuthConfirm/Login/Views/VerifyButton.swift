//
//  VerifyButton.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct VerifyButton: View {

    let text: String
    @Binding var state: ViewState

    var onAction: () -> Void

    var body: some View {

        Button {
            onAction()
        } label: {
            HStack {

                if state == .loading {
                    ProgressView()
                }

                Text(text)
                    .font(.system(.body, weight: .semibold))
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.purpleBackground)
            )
        }
        .disabled(state != .idle)
        .opacity(state == .idle ? 1 : 0.5)
    }
}
