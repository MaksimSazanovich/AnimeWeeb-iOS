//
//  ProfileCard.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import NukeUI
import SwiftUI

struct ProfileCard: View {

    let user: User
    var onLogout: () -> Void

    var body: some View {
        ZStack {
            VStack(spacing: 35) {
                // MARK: Image
                LazyImage(url: user.avatarPath) { state in
                    if let image = state.image {
                        image
                            .resizable()
                            .scaledToFill()     
                    }
                }
                .frame(width: 128, height: 128)
                .clipShape(.circle)
                .overlay(
                    Circle()
                        .stroke(.purpleBackground.opacity(0.5), lineWidth: 1)
                )

                VStack {
                    // MARK: Name
                    Text(user.name)
                        .font(.system(.largeTitle, weight: .bold))
                        .foregroundStyle(.largeTitle)
                        .multilineTextAlignment(.center)

                    VStack(spacing: 10) {
                        // MARK: Email
                        Text(user.email)
                            .font(.body)
                            .foregroundStyle(.subtitle)
                            .multilineTextAlignment(.center)

                        // MARK: Level
                        Text("Level \(user.level)")
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

                AWDivider()

                Button {
                    onLogout()
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

                        Image(systemName: "square.and.pencil")
                            .font(.system(.title3, weight: .bold))
                            .foregroundStyle(.subtitle)
                    }
                    .frame(width: 40, height: 40)
                }
                .padding(24)
            }
        }
    }
}
