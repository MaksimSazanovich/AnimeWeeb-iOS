//
//  QualityPicker.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct QualityPicker: View {
    @Binding var selectedQuality: QualityType
    let qualities: [QualityType]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("КАЧЕСТВО")
                .font(.system(.caption, weight: .medium))
                .foregroundStyle(.genreText)

            HStack(spacing: 8) {
                ForEach(qualities, id: \.self) { quality in
                    let isSelected = selectedQuality == quality
                    
                    Button {
                        selectedQuality = quality
                    } label: {
                        Text(quality.rawValue)
                            .font(.system(.subheadline, weight: .medium))
                            .foregroundStyle(isSelected ? Color.background : .subtitle)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(isSelected ? .mainTitle : .stroke)
                            )
                    }
                    .buttonStyle(.plain)
                }

            }
        }
    }
}
