//
//  GetCodeButton.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct GetCodeButton: View {

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
                
                Text("Получить код")
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
        .disabled(state == .loading)
        .opacity(state == .loading ? 0.5 : 1)
    }
}
