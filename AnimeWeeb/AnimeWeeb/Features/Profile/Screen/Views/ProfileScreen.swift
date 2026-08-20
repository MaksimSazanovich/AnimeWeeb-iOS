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
    let imageURL: URL?

    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 32) {
                    // MARK: Profile Card
                    VStack(spacing: 35) {
                        // MARK: Image
                        LazyImage(url: viewModel.user.avatarPath) { state in
                            if let image = state.image {
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(.circle)
                            }
                        }
                        .frame(width: 128, height: 128)
                        .overlay(
                            Circle()
                                .stroke(.purpleBackground.opacity(0.5), lineWidth: 1)
                        )

                        VStack {
                            // MARK: Name
                            Text(viewModel.user.name)
                                .font(.system(.largeTitle, weight: .bold))
                                .foregroundStyle(.largeTitle)
                                .multilineTextAlignment(.center)

                            VStack(spacing: 10) {
                                // MARK: Email
                                Text(viewModel.user.email)
                                    .font(.body)
                                    .foregroundStyle(.subtitle)
                                    .multilineTextAlignment(.center)

                                // MARK: Level
                                Text("Level \(viewModel.user.level)")
                                    .lineLimit(1)
                                    .font(.footnote)
                                    .foregroundStyle(.seasonBadgeText)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 3)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(.seasonBadge.opacity(0.1))
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.seasonBadge.opacity(0.2), lineWidth: 1)
                                    )
                            }
                        }

                        CustomDivider()

                        Button {
                            // TODO: Logout logic
                            print("Logout")
                        } label: {
                            Label("Выйти", systemImage: "rectangle.portrait.and.arrow.right")
                                .foregroundStyle(.subtitle)
                        }

                    }
                    .frame(maxWidth: .infinity)
                    .padding(33)
                    .animeCardBackgroundModifier(cornerRadius: 16, fillOpacity: 0.4, strokeOpacity: 1)
                    .overlay(alignment: .topTrailing) {
                        // MARK: Edit Button
                        Button {
                            // TODO: Edit logic
                            print("Edit")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 7)
                                    .fill(.stroke)
                                    .frame(width: 35, height: 35)

                                Image(systemName: "square.and.pencil")
                                    .font(.system(.body, weight: .bold))
                                    .foregroundStyle(.subtitle)
                            }
                        }
                        .padding(24)
                    }

                    CustomDivider()

                    // MARK: Watch History
                    VStack(alignment: .leading) {
                        Text("История просмотра")
                            .font(.system(.title, weight: .semibold))
                            .foregroundStyle(.largeTitle)

                        ForEach(viewModel.watchHistory ?? []) { model in
                            VStack {
                                WatchHistoryItemView(model: model) {
                                    // TODO: Navigation
                                    print("Navigation to episode with timecode")
                                }
                            }
                        }

                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    CustomDivider()
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 50)
                .padding(.horizontal)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)

    }
}

#Preview {
    ProfileScreen(viewModel: ProfileViewModel(userService: UserService(user: previewUser, state: .authenticated)), imageURL: previewAnimeModel.imageURL)
}
