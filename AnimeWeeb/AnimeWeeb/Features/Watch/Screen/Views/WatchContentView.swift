//
//  WatchContentView.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct WatchContentView: View {
    
    @Bindable var viewModel: WatchViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 30) {
                    // MARK: Breadcrumbs
                    BreadcrumbsView(items: viewModel.breadcrumbs) { item in
                        viewModel.didTapBreadcrumbItem(item)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        // MARK: Season Title
                        Text(viewModel.season)
                            .font(.system(.title, weight: .semibold))
                            .foregroundStyle(.white)
                        
                        // MARK: Episode Title
                        Text("Эпизод \(viewModel.episode.number)")
                            .font(.body)
                            .foregroundStyle(.subtitle)
                    }
                }
                
                if viewModel.selectedPlayer == .animeWeeb {
                    playerSettings
                }
                
                // MARK: Player Segmented Picker
                Picker("Плеер", selection: $viewModel.selectedPlayer) {
                    Text("Наш плеер").tag(PlayerType.animeWeeb)
                    Text("Kodik").tag(PlayerType.kodik)
                }
                .pickerStyle(.segmented)
                .frame(width: 180)
                .animeCardBackgroundModifier(cornerRadius: 16, fillOpacity: 0.5, strokeOpacity: 1)
                .onAppear {
                    UISegmentedControl.appearance().selectedSegmentTintColor = .purpleBackground
                    
                    UISegmentedControl.appearance().setTitleTextAttributes([
                        .foregroundColor: UIColor.subtitle
                    ], for: .normal)
                    
                    UISegmentedControl.appearance().setTitleTextAttributes([
                        .foregroundColor: UIColor.mainTitle
                    ], for: .selected)
                }
                
                VStack(spacing: 12) {
                    if let url = viewModel.url {
                        AWVideoPlayer(url: url, startTime: viewModel.timeCode, onTimeUpdate: { currentTime in
                            viewModel.updateCurrentTimecode(currentTime)
                        })
                            .frame(maxWidth: .infinity)
                            .aspectRatio(16/9, contentMode: .fit)
                            .id(viewModel.episode.id)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    } else {
                        // MARK: AD
                        VStack {
                            ZStack {
                                Text("AD")
                                    .foregroundStyle(.white)
                            }
                            .frame(maxWidth: .infinity, minHeight: 125)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.black.opacity(0.3))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .strokeBorder(.stroke, lineWidth: 1)
                            )
                            
                            // MARK: Button
                            Button {
                                
                            } label: {
                                Text("Продолжить просмотр")
                                    .font(.system(.body, weight: .semibold))
                                    .foregroundStyle(.white)
                                    .padding(.horizontal, 25)
                                    .padding(.vertical)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(.purpleBackground)
                                    )
                            }
                        }
                        .padding(.horizontal, 25)
                        .padding(.vertical, 13)
                    }
                       
                }
                
                
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.background)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .strokeBorder(.stroke.opacity(0.5), lineWidth: 1)
                )
                
                // MARK: Episode Card
                EpisodesCard(episodesCount: 12, seasons: viewModel.seasons, selectedEpisode: viewModel.episode) { episode, season in
                    viewModel.didSelectEpisode(episode: episode, season: season)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .onDisappear {
            Task(priority: .utility) {
                await viewModel.saveWatchHistory()
            }
        }
    }
}

extension WatchContentView {
    var playerSettings: some View {
        VStack(alignment: .leading, spacing: 16.5) {
            // MARK: Dabber
            HStack(spacing: 24) {
                VStack(alignment: .leading) {
                    Text("ОЗВУЧКА")
                        .font(.system(.caption, weight: .medium))
                        .foregroundStyle(.genreText)
                    
                    Text("RU")
                        .font(.system(.subheadline, weight: .medium))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.purpleBackground)
                        )
                }
                
                Rectangle()
                    .fill(.stroke)
                    .frame(width: 1)
                    .padding(.vertical)
                
                VStack(alignment: .leading) {
                    Text("ВАРИАНТ")
                        .font(.system(.caption, weight: .medium))
                        .foregroundStyle(.genreText)
                    
                    Text("AniLibria")
                        .font(.system(.subheadline, weight: .medium))
                        .foregroundStyle(Color.background)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.mainTitle)
                        )
                }
                
                Rectangle()
                    .fill(.stroke)
                    .frame(width: 1)
                    .padding(.vertical)
            }
            
            // MARK: Quality Picker
            QualityPicker(selectedQuality: $viewModel.selectedQuality, qualities: viewModel.qualities)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .animeCardBackgroundModifier(cornerRadius: 12, fillOpacity: 0.5, strokeOpacity: 0.5)
    }
}
