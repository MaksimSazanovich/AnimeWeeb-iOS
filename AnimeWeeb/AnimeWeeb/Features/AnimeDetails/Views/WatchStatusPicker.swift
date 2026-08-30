//
//  WatchStatusPicker.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct WatchStatusPicker: View {
    @Binding var selectedStatus: WatchStatus?
    
    var body: some View {
        HStack {
            Menu {
                ForEach(WatchStatus.allCases, id: \.self) { status in
                    Button(status.name) {
                        selectedStatus = status
                    }
                }
                
                if selectedStatus != nil {
                    Button(role: .destructive) {
                        selectedStatus = nil
                    } label: {
                        Text("Удалить из списка")
                    }
                }
            } label: {
                HStack(spacing: 8) {
                    Image(systemName: "bookmark")
                        .font(.system(size: 16))
                    
                    Text(selectedStatus?.name ?? "Добавить в список")
                        .font(.system(size: 16, weight: .medium))
                }
                .fixedSize(horizontal: true, vertical: false)
                
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(.stroke)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.menuButtonStroke, lineWidth: 2)
                )
            }
            .animation(.easeOut(duration: 0.2), value: selectedStatus)
            
            Spacer()
        }
    }
}
