//
//  LoginScreen.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import GoogleSignInSwift
import SwiftUI

struct LoginScreen: View {

    @Bindable var viewModel: LoginViewModel

    var body: some View {

        ScrollView {
            ZStack {
                VStack {
                    VStack(spacing: 8) {
                        Text("Войти")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundStyle(.white)

                        VStack(spacing: 32) {
                            Text("Введите email, чтобы получить код")
                                .font(.subheadline)
                                .foregroundStyle(.subtitle)

                            // MARK: Google Button
                            GoogleSignInButton {
                                viewModel.didTapLoginWithGoogle()
                            }
                            .disabled(viewModel.state == .loading)

                            ZStack {
                                CustomDivider()

                                Text("или через email")
                                    .font(.caption)
                                    .foregroundStyle(.genreText)
                                    .padding(.horizontal, 12)
                                    .background(Color.background)
                            }

                            VStack(spacing: 16) {
                                // MARK: Email TextField
                                EmailTextField(email: $viewModel.email)

                                // MARK: GetCode Button
                                GetCodeButton(state: $viewModel.state) {
                                    viewModel.didTapGetCodeButton()
                                }
                            }

                            // MARK: Error View
                            if case .failed(let error) = viewModel.state {
                                ErrorView(title: error.localizedDescription)
                                    .lineLimit(2)
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
    }
}

#Preview {
    // LoginScreen(viewModel: LoginViewModel())
}
