//
//  RegisterScreen.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct RegisterScreen: View {

    @State var viewModel: RegisterViewModel
    @State var email: String = ""

    var body: some View {

        ZStack {
            VStack {
                VStack(spacing: 8) {
                    Text("Создать аккаунт")
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
                            CustomDivider()

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

                        // MARK: Login Button
                        Button {
                            // TODO: Login logic
                            viewModel.didTapSwitchAuthButton()
                        } label: {
                            Text("Уже есть аккаунт? Войти")
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
        .padding()
        .background(Color.background)
        .dismissKeyboardOnTap()
    }
}

#Preview {
    RegisterScreen(viewModel: RegisterViewModel())
}
