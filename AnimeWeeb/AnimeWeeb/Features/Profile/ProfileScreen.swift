//
//  ProfileScreen.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import NukeUI
import SwiftUI

struct ProfileScreen: View {

    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 32) {
                    VStack {
                        // LazyImage(url: <#T##URL?#>)
                    }
                    .animeCardBackgroundModifier()
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
    ProfileScreen()
}
