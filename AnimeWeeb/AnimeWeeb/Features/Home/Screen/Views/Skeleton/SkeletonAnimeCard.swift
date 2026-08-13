//
//  SkeletonAnimeCard.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI
import Shimmer

struct SkeletonAnimeCard: View {
    var body: some View {
        VStack(alignment: .leading) {
            // MARK: Image
            UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(
                topLeading: 12,
                bottomLeading: 0,
                bottomTrailing: 0,
                topTrailing: 12))
            .aspectRatio(2/3, contentMode: .fill)
            .skeletonColor()
            
           
            
            
            VStack(alignment: .leading) {
                //MARK: Title
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 95, height: 15)
                    .skeletonColor()
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 70, height: 12)
                    .skeletonColor()
                
                // MARK: Tag Cloud
                HStack {
                    RoundedRectangle(cornerRadius: 7)
                        .skeletonColor()
                    
                    RoundedRectangle(cornerRadius: 7)
                        .skeletonColor()
                }
                .frame(height: 20)
                
                
                
            }
            .padding(12)
            
            Spacer(minLength: 0)
        }
       
        .animeCardBackgroundModifier(cornerRadius: 12)
    }
}

#Preview {
    SkeletonAnimeCard()
}
