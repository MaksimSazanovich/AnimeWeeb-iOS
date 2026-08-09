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
                        
                        VStack(spacing: 16) {
                            // MARK: Email TextField
                            EmailTextField(email: $email)
                            
                            // MARK: GetCode Button
                            Button {
                                // TODO: GetCode logic
                                print("Get code")
                            } label: {
                                Text("Получить код")
                                    .font(.system(.body, weight: .semibold))
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(.purpleBackground)
                                    )
                            }
                        }
                        
                        // MARK: NoAccount Button
                        Button {
                            // TODO: NoAccount logic
                            print("No Account")
                        } label: {
                            Text("Нет аккаунта? Зарегистрироваться")
                                .font(.system(size: 14))
                                .foregroundStyle(.seasonBadgeText)
                        }
                        
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(33)
            .animeCardBackgroundModifier(cornerRadius: 16, fillOpacity: 0.5, strokeOpacity: 1)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(32)
        .background(Color.background)
        .navigationBarBackButtonHidden()
        .dismissKeyboardOnTap()
    }
}

#Preview {
    LoginScreen()
}

