//
//  ProfileScreen.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import NukeUI
import SwiftUI

struct ProfileScreen: View {

    let viewModel: ProfileViewModel

    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 32) {
                    switch viewModel.cardState {
                    case .idle:
                        // MARK: Profile Card
                        ProfileCard(user: viewModel.user) {
                            Task {
                                await viewModel.didTapLogout()
                            }
                        } onEdit: {
                            viewModel.didTapEdit()
                        }

                    case .edit:
                        // MARK: Profile Edit Card
                        ProfileEditCard(user: viewModel.user, viewModel: viewModel.profileEditViewModel) {
                            viewModel.didTapCancelEdit()
                        }
                    }

                    AWDivider()

                    // MARK: Watch History
                    WatchHistoryView(viewModel: viewModel.watchHistoryViewModel)

                    AWDivider()

                    // MARK: User Anime Lists
                    UserAnimeListsView(viewModel: viewModel.userAnimeListsViewModel)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 16)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .padding(.horizontal)
        .background(Color.background)
    }
}
