//
//  AWImagePicker.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import NukeUI
import PhotosUI
import SwiftUI

@MainActor
struct AWImagePicker: View {
    
    @State private var selectedItem: PhotosPickerItem?
    @State private var image: Image?
    @State private var dataImage: Data?
    @State var imagePath: URL?
    
    var onChanged: (Data) -> Void
    
    var body: some View {
        PhotosPicker(selection: $selectedItem, matching: .images) {
            if let imagePath {
                RemoteAvatarView(imagePath: imagePath)
            } else if let image {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 126, height: 126)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(.stroke, style: StrokeStyle(lineWidth: 2, dash: [4, 4]))
                    }
            } else {
                ZStack {
                    Circle()
                        .fill(.profileButtonBackground)
                        .strokeBorder(.stroke, style: StrokeStyle(lineWidth: 2, dash: [4, 4]))
                        .frame(width: 126, height: 126)
                    
                    VStack(spacing: 8) {
                        Image(systemName: "plus")
                            .font(.system(.largeTitle, weight: .medium))
                            .foregroundStyle(.genreText)
                        
                        Text("ЗАГРУЗИТЬ")
                            .font(.footnote)
                            .foregroundStyle(.genreText)
                    }
                }
            }
        }
        .buttonStyle(.plain)
        .onChange(of: selectedItem) { _, newValue in
            Task {
                guard let newValue else { return }
                
                if let loadedImage = try? await newValue.loadTransferable(type: Image.self) {
                    
                    self.image = loadedImage
                    self.imagePath = nil
                }
                
                if let data = try? await newValue.loadTransferable(type: Data.self) {
                    
                    onChanged(data)
                    self.imagePath = nil
                }
                
            }
        }
    }
}

@MainActor
private struct RemoteAvatarView: View {
    
    var imagePath: URL
    
    var body: some View {
        LazyImage(url: imagePath) { state in
            if let image = state.image {
                image
                    .resizable()
                    .scaledToFill()
            }
        }
        .frame(width: 126, height: 126)
        .clipShape(Circle())
        .overlay {
            ZStack {
                Circle()
                    .fill(.black.opacity(0.4))
                
                Image(systemName: "camera")
                    .font(.system(.title3, weight: .bold))
                    .foregroundStyle(.white)
            }
        }
        .overlay {
            Circle()
                .strokeBorder(.stroke, style: StrokeStyle(lineWidth: 2, dash: [4, 4]))
        }
    }
    
}

#Preview {
    AWImagePicker(imagePath: previewUserAvatarURL) {_ in
        
    }
}
