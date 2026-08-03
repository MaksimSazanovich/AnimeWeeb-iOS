//
//  HomeScreen.swift
//  AnimeWeeb
//

import SwiftUI

struct HomeScreen: View {
    
    var animes: [NewReleasesAnimeModel]
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            
            ScrollView {
                VStack(alignment: .leading) {
                    // MARK: - New Releases
                    Text("Новое на сайте")
                        .font(.system(.largeTitle, weight: .semibold))
                        .foregroundStyle(.largeTitle)
                    
                    VStack(alignment: .leading, spacing: 32) {
                        
                        VStack(spacing: 50) {
                            //MARK: New Releases ScrollView
                            NewReleasesScrollView(animes: animes)
                            
                            Rectangle()
                                .fill(.stroke.opacity(0.8))
                                .frame(height: 1)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Каталог")
                                .font(.system(.largeTitle, weight: .semibold))
                                .foregroundStyle(.largeTitle)
                            
                            Text("От ценителей — для ценителей!")
                                .font(.subheadline)
                                .foregroundColor(.subtitle)
                        }
                        
                    }
                    
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 40)
                .padding(.horizontal)
            }
            .safeAreaInset(edge: .top) {
                // MARK: - App Header
                AppHeaderView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }
}

#Preview {
    HomeScreen(animes: previewNewReleasesAnimeModels)
}

