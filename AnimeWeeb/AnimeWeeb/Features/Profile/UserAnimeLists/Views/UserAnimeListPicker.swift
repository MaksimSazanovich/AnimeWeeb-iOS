//
//  UserAnimeListPicker.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct UserAnimeListPicker: View {

    @Binding var selectedStatus: WatchStatus
    let profileViewModel: ProfileViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(WatchStatus.allCases) { status in
                    let isSelected = selectedStatus == status
                    let animeList = profileViewModel.getUserAnimeList(for: status)

                    HStack {
                        Text(status.rawValue)

                        Text("\(animeList.count)")
                            .padding(.horizontal, 10)
                            .padding(.vertical, 3)
                            .background(
                                RoundedRectangle(cornerRadius: 7)
                                    .fill(.white.opacity(0.1))

                            )

                    }
                    .font(.system(.body, weight: .medium))
                    .foregroundStyle(isSelected ? .white : .subtitle)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(isSelected ? .purpleBackground : .profileButtonBackground)
                    )
                    .onTapGesture {
                        selectedStatus = status
                    }

                }
            }
        }
    }
}
