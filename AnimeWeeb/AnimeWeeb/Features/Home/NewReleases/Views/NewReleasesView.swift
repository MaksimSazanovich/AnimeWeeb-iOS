//
//  NewReleasesView.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct NewReleasesView: View {

    var animes: [NewReleasesAnimeModel]
    let homeViewModel: HomeViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Новое на сайте")
                .font(.system(.largeTitle, weight: .semibold))
                .foregroundStyle(.largeTitle)

            VStack(spacing: 30) {
                // MARK: New Releases ScrollView
                NewReleasesScrollView(animes: animes, homeViewModel: homeViewModel)

                CustomDivider(color: .stroke.opacity(0.8))
            }
        }
    }
}

#Preview {
    ZStack {
        NewReleasesView(animes: previewNewReleasesAnimeModels, homeViewModel: HomeViewModel(repository: HomeRepository(networkService: NetworkService())))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 40)
            .padding(.horizontal)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.background)
}
