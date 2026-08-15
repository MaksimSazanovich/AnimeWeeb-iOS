//
//  WatchScreen.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct WatchScreen: View {
    
    let viewModel: WatchViewModel
    @State var selectedPlayer: PlayerType = .animeWeeb
    
    var body: some View {
        ZStack { // TODO: switch state
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: 30){
                        Text("Каталог / \(viewModel.title) / Эпизод \(viewModel.episode)")
                            .font(.body)
                            .foregroundStyle(.genreText)
                            
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text(viewModel.season)
                                .font(.system(.title, weight: .semibold))
                                .foregroundStyle(.white)
                            
                            Text("Эпизод \(viewModel.episode)")
                                .font(.body)
                                .foregroundStyle(.subtitle)
                        }
                    }
                    
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
                        VStack(alignment: .leading) {
                            Text("КАЧЕСТВО")
                                .font(.system(.caption, weight: .medium))
                                .foregroundStyle(.genreText)
                            
                            HStack(spacing: 8) {
                                ForEach([1080, 720, 480], id: \.self) { size in
                                    Button {
                                        
                                    } label: {
                                        Text("\(size)P")
                                            .font(.system(.subheadline, weight: .medium))
                                            .foregroundStyle(Color.background)
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 6)
                                            .background(
                                                RoundedRectangle(cornerRadius: 8)
                                                    .fill(.mainTitle)
                                            )
                                    }

                                    
                                }
                                
                                
                                
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .animeCardBackgroundModifier(cornerRadius: 12, fillOpacity: 0.5, strokeOpacity: 0.5)
                    
                    // MARK: Player Segmented Picker
                    Picker("Плеер", selection: $selectedPlayer) {
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
                    
                    VStack(spacing: 12)  {
                        // MARK: AD
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
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.background)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .strokeBorder(.stroke.opacity(0.5), lineWidth: 1)
                    )
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 50)
        .padding(.horizontal)
        .background(Color.background)
        .task {
            await viewModel.loadEpisode()
        }
    }
}

#Preview {
    WatchScreen(viewModel: WatchViewModel(model: previewWatchModel, repository: WatchRepository(networkService: NetworkService())))
}

