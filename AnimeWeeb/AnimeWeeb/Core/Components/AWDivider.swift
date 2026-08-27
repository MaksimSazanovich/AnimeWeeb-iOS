//
//  AWDivider.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct AWDivider: View {
    var color: Color = .stroke
    var height: CGFloat = 1

    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: height)
    }
}

#Preview {
    AWDivider()
}
