//
//  UserAnimeListsView.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct UserAnimeListsView: View {

    let viewModel: UserAnimeListsViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("Мои списки")
                .font(.system(.title, weight: .bold))
                .foregroundStyle(.largeTitle)

            // MARK: Anime List Picker
            UserAnimeListPicker(viewModel: viewModel)

            // MARK: User Anime List
            switch viewModel.state {
            case .idle, .loading:
                ProgressView()
                    .frame(maxWidth: .infinity, alignment: .center)

            case .failed(let error):
                AWErrorView(title: error.localizedDescription)

            case .loaded, .empty:
                let currentList = viewModel.getUserAnimeList(for: viewModel.selectedStatus)

                if currentList.isEmpty {
                    AWEmptyView(title: "В этом списке ещё нет тайтлов.")
                } else {
                    VStack(spacing: 16) {
                        ForEach(currentList) { model in
                            UserAnimeListCard(model: model) {
                                viewModel.onCardTap?(model.titleID)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .task {
            await viewModel.getLists()
        }
    }
}
