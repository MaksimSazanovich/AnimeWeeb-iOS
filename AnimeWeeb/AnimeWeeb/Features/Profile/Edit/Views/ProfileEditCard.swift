//
//  ProfileEditCard.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import NukeUI
import SwiftUI

struct ProfileEditCard: View {
    
    let user: User
    @Bindable var viewModel: ProfileEditViewModel
    
    var onCancel: () -> Void
    
    var body: some View {
        ZStack {
            VStack(spacing: 35) {
                
                AWImagePicker(imagePath: user.avatarPath) { avatar in
                    viewModel.updateAvatar(avatar: avatar)
                }
                
                VStack(spacing: 20){
                    VStack {
                        Text("НИКНЕЙМ")
                            .font(.callout)
                            .foregroundStyle(.subtitle)
                        
                        AWTextField(text: $viewModel.nickname, placeholder: "Ваш никнейм")
                    }
                    
                    // MARK: Email
                    Text(user.email)
                        .font(.body)
                        .foregroundStyle(.subtitle)
                        .multilineTextAlignment(.center)
                }
                
                HStack(spacing: 12) {
                    // MARK: Save changes Button
                    Button {
                       
                        
                        
                    } label: {
                        HStack {
                            Text("Сохранить")
                                .font(.system(.body, weight: .semibold))
                                .foregroundStyle(.white)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.purpleBackground)
                        )
                    }
                    .disabled(viewModel.state != .idle)
                    .opacity(viewModel.state == .idle ? 1 : 0.5)
                    
                    // MARK: Cancel Button
                    Button {
                        onCancel()
                    } label: {
                        HStack {
                            Text("Отменить")
                                .font(.system(.body, weight: .semibold))
                                .foregroundStyle(.menuIcon)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.stroke)
                        )
                    }
                }
                
            }
            
        }
        .frame(maxWidth: .infinity)
        .padding(33)
        .animeCardBackgroundModifier(cornerRadius: 16, fillOpacity: 0.4, strokeOpacity: 1)
    }
}
