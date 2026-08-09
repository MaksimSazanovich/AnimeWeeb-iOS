//
//  LoginScreen.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct LoginScreen: View {
    
    @State var email: String = ""
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                    VStack(spacing: 8) {
                        Text("Войти")
                            .font(.system(.largeTitle, weight: .bold))
                            .foregroundStyle(.white)
                        
                        VStack(spacing: 32) {
                            Text("Введите email, чтобы получить код")
                                .font(.subheadline)
                                .foregroundStyle(.subtitle)
                            
                            // TODO: Google Button
                            ZStack {
                                RoundedRectangle(cornerRadius: 40)
                                    .fill(.white)
                                    .frame(maxWidth: .infinity, maxHeight: 40)
                                
                                Text("Тут будет гугол")
                                    .font(.body)
                                    .foregroundStyle(.black)
                            }
                            
                            ZStack {
                                Rectangle()
                                    .fill(.stroke)
                                    .frame(height: 1)
                                
                                Text("или через email")
                                    .font(.caption)
                                    .foregroundStyle(.genreText)
                                    .padding(.horizontal, 12)
                                    .background(Color.background)
                            }
                            
                            // MARK: Email TextField
                            EmailTextField(email: $email)
                            
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .animeCardBackgroundModifier(cornerRadius: 16, fillOpacity: 0.5, strokeOpacity: 1)
                .padding(32)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .containerRelativeFrame(.vertical)
        }
        .scrollBounceBehavior(.basedOnSize)
        .background(Color.background)
        .navigationBarBackButtonHidden()
        .contentShape(Rectangle())
        .dismissKeyboardOnTap()
    }
}

#Preview {
    LoginScreen()
}

