//
//  UserAnimeListsView.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct UserAnimeListsView: View {

    @Binding var selectedStatus: WatchStatus
    let profileViewModel: ProfileViewModel

    var onCardTap: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("Мои списки")
                .font(.system(.title, weight: .bold))
                .foregroundStyle(.largeTitle)

            // MARK: Anime List Picker
            UserAnimeListPicker(selectedStatus: $selectedStatus, profileViewModel: profileViewModel)

            // MARK: User Anime List
            VStack(spacing: 16) {
                ForEach(profileViewModel.getUserAnimeList(for: selectedStatus)) { model in
                    UserAnimeListCard(model: model) {
                        onCardTap()
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity)
    }
}
