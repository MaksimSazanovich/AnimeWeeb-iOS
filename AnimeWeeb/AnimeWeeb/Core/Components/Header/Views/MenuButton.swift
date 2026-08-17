//
//  MenuButton.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct MenuButton: View {

    var onAction: () -> Void

    var body: some View {
        Button {
            onAction()
        } label: {
            ZStack {
                Image(systemName: "line.horizontal.3")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundStyle(Color(.menuIcon))
            }
            .frame(width: 38, height: 38)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.menuButtonStroke, lineWidth: 1))
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }

    }
}
