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

    @State var selectedStatus: WatchStatus = .watching

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
                    WatchHistoryView(watchHistory: viewModel.watchHistory ?? [])

                    AWDivider()

                    // MARK: User Anime Lists
                    UserAnimeListsView(selectedStatus: $selectedStatus, profileViewModel: viewModel) {
                        // TODO: Navigate to anime
                        print("Navigate to anime")
                    }
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
