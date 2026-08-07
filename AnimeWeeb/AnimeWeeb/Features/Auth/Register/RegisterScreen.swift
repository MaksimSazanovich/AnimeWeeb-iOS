//
//  RegisterScreen.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct RegisterScreen: View {
    var body: some View {
        Text("Register")
            .font(.largeTitle)
    }
}

#Preview {
    VStack(spacing: 0){
        
        AppHeaderView(viewModel: AppHeaderViewModel(urlOpener: AppURLOpener()))
        
        RegisterScreen()
    }
}
