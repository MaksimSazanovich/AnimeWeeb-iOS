//
//  LoginScreen.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct LoginScreen: View {

    let viewModel: LoginViewModel
    @State var email: String = ""

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
                                GetCodeButton {

                                    viewModel.didTapGetCodeButton()
                                }
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
    LoginScreen(viewModel: LoginViewModel())
}
