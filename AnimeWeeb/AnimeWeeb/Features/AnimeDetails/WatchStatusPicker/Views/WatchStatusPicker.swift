//
//  WatchStatusPicker.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct WatchStatusPicker: View {
    @Bindable var viewModel: WatchStatusPickerViewModel

    var body: some View {
        HStack {
            Menu {
                ForEach(WatchStatus.allCases, id: \.self) { status in
                    Button(status.name) {
                        viewModel.selectedStatus = status
                    }
                }

                if viewModel.selectedStatus != nil {
                    Button(role: .destructive) {
                        viewModel.selectedStatus = nil
                    } label: {
                        Text("Удалить из списка")
                    }
                }
            } label: {
                HStack(spacing: 8) {
                    if viewModel.state == .idle {
                        Image(systemName: "bookmark")
                            .font(.system(size: 16))
                    } else if viewModel.state == .loading {
                        ProgressView()
                    }

                    Text(viewModel.selectedStatus?.name ?? "Добавить в список")
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
            .animation(.easeOut(duration: 0.2), value: viewModel.selectedStatus)
            .disabled(viewModel.state != .idle)
            .opacity(viewModel.state != .idle ? 0.5 : 1)
            Spacer()
        }
        .onChange(of: viewModel.selectedStatus) { oldValue, newValue in
            if oldValue != newValue {
                Task {
                    await viewModel.postStatus()
                }
            }
        }
    }
}
