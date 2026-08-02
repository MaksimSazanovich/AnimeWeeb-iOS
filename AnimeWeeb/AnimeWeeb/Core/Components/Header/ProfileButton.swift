//
//  ProfileButton.swift
//  AnimeWeeb
//

import SwiftUI

struct ProfileButton: View {
    
    var profileImage: Image?
    
    var body: some View {
        Button {
            print("Profile Button pressed")
        } label: {
            ZStack {
                if let profileImage {
                    profileImage
                }
            }
            .frame(width: 36, height: 36)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(.profileButtonBackground))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.stroke, lineWidth: 1))
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }

    }
}
