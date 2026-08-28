//
//  RegisterConfirmScreen.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import GoogleSignInSwift
import SwiftUI

struct RegisterConfirmScreen: View {
    @Bindable var viewModel: RegisterConfirmViewModel

    var body: some View {

        ZStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    VStack(spacing: 8) {
                        Text("Заполнить профиль")
                            .font(.system(size: 30, weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)

                        VStack(spacing: 32) {
                            Text("Укажите никнейм и аватар")
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.subtitle)

                            // MARK: Google Button
                            GoogleSignInButton {
                                viewModel.didTapLoginWithGoogle()
                            }

                            ZStack {
                                AWDivider()

                                Text("или через email")
                                    .font(.caption)
                                    .foregroundStyle(.genreText)
                                    .padding(.horizontal, 12)
                                    .background(Color.background)
                            }

                            // MARK: Verification code
                            VStack(spacing: 15) {
                                Text("Код подтверждения")
                                    .font(.system(.body, weight: .medium))
                                    .foregroundStyle(.menuIcon)

                                AuthConfirmInputView(code: $viewModel.code, codeLength: viewModel.codeLength)
                            }

                            // MARK: Nickname TextField
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Никнейм")
                                    .font(.system(.body, weight: .medium))
                                    .foregroundStyle(.menuIcon)

                                AWTextField(text: $viewModel.nickname, placeholder: "Ваш никнейм")
                            }

                            // MARK: Avatar Picker
                            VStack {
                                Text("Аватар")
                                    .font(.system(.body, weight: .medium))
                                    .foregroundStyle(.menuIcon)

                                AWImagePicker { data in
                                    viewModel.updateAvatar(avatar: data)
                                }
                            }

                            // MARK: Verify Button
                            VerifyButton(text: "Завершить регистрацию", state: $viewModel.state) {
                                viewModel.didTapVerifyButton()
                            }

                            // MARK: Error View
                            if case .failed(let error) = viewModel.state {
                                AWErrorView(title: error.localizedDescription)
                            }

                            // MARK: Login Button
                            Button {
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
            .padding(32)
        }
        .scrollBounceBehavior(.basedOnSize)
        .dismissKeyboardOnTap()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }
}

#Preview {
    let viewModel = RegisterConfirmViewModel(
        email: "fd@fd",
        authRepository: AuthRepository(
            networkService: NetworkService(),
            googleService: GoogleService(),
            userRepository: UserRepository(networkService: NetworkService())
        ),
        userService: UserService()
    )
    viewModel.code = "1235"
    return RegisterConfirmScreen(viewModel: viewModel)
}
