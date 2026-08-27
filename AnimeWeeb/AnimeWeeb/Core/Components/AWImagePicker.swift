//
//  AWImagePicker.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI
import PhotosUI

struct AWImagePicker: View {
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var profileImage: Image? = nil
    @State var dataImage: Data? = nil
    
    var onChanged: (Data) -> Void
    
    var body: some View {
        PhotosPicker(selection: $selectedItem, matching: .images) {
            if let profileImage {
                profileImage
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
                    await MainActor.run {
                        self.profileImage = loadedImage
                    }
                }
                     
                if let data = try? await newValue.loadTransferable(type: Data.self) {
                    await MainActor.run {
                        onChanged(data)
                    }
                }
            }
        }
    }
}

#Preview {
    AWImagePicker() {_ in
        
    }
}
