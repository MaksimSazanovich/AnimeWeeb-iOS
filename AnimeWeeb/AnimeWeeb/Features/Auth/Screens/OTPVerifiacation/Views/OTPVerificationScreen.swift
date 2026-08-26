//
//  OTPVerificationScreen.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI
import GoogleSignInSwift

struct OTPVerificationScreen: View {
    
    @Bindable var viewModel: OTPVerificationViewModel
    
    var body: some View {
        
        ScrollView {
            ZStack {
                VStack {
                    VStack(spacing: 8) {
                        Text("Введите код")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundStyle(.white)
                        
                        VStack(spacing: 32) {
                            Text("Введите код подтверждения, отправленный на email")
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.subtitle)
                            
                            // MARK: Google Button
                            GoogleSignInButton {
                                
                            }
                            
                            
                            ZStack {
                                CustomDivider()
                                
                                Text("или через email")
                                    .font(.caption)
                                    .foregroundStyle(.genreText)
                                    .padding(.horizontal, 12)
                                    .background(Color.background)
                            }
                            
                            // MARK: Verification code
                            VStack(spacing: 15) {
                                Text("Код подтверждения")
                                    .font(.body)
                                    .foregroundStyle(.white)
                                
                                OTPInputView(code: $viewModel.code)
                            }
                            
                            
                            
                            // MARK: Login Button
                            Button {
                                
                            } label: {
                                HStack {
                                    Text("Войти")
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
                            
                            
                            // MARK: Change email Button
                            Button {
                                viewModel.didTapCahngeEmail()
                            } label: {
                                Text("Изменить email")
                                    .font(.caption)
                                    .foregroundStyle(.genreText)
                            }
                            
                            // MARK: NoAccount Button
                            Button {
                                viewModel.didTapSwitchAuthButton()
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
            .padding()
            .containerRelativeFrame(.vertical)
        }
        .scrollBounceBehavior(.basedOnSize)
        .background(Color.background.ignoresSafeArea())
        .dismissKeyboardOnTap()
        .padding(.top, 100)
    }
}

#Preview {
    let viewModel = OTPVerificationViewModel()
    viewModel.code = "1235"
    return OTPVerificationScreen(viewModel: viewModel)
}

