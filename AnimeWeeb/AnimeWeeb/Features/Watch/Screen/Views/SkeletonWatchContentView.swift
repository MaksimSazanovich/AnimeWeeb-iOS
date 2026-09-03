//
//  SkeletonWatchContentView.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Shimmer
import SwiftUI

struct SkeletonWatchContentView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 30) {
                    VStack {
                        // MARK: Breadcrumbs
                        RoundedRectangle(cornerRadius: 7, style: .continuous)
                            .skeletonColor()
                            .frame(maxWidth: .infinity, minHeight: 24)
                        
                        RoundedRectangle(cornerRadius: 7, style: .continuous)
                            .skeletonColor()
                            .frame(maxWidth: .infinity, minHeight: 24)
                            .padding(.trailing, 30)
                    }
                    
                    VStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 7, style: .continuous)
                            .skeletonColor()
                            .frame(maxWidth: .infinity, minHeight: 36)
                        
                        RoundedRectangle(cornerRadius: 7, style: .continuous)
                            .skeletonColor()
                            .frame(maxWidth: 90, minHeight: 20)
                    }
                    
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .skeletonColor()
                        .frame(maxWidth: .infinity, minHeight: 150)
                    
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .skeletonColor()
                        .frame(maxWidth: 180, minHeight: 32)
                    
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .skeletonColor()
                        .frame(maxWidth: .infinity, minHeight: 215)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .shimmering()
    }
}


#Preview {
    SkeletonWatchContentView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
}
