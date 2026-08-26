//
//  RegisterScreen.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import GoogleSignInSwift
import SwiftUI

struct RegisterScreen: View {

    @State var viewModel: RegisterViewModel

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
                        if case let .failed(error) = viewModel.state {
                            ErrorView(title: error.localizedDescription)
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
    RegisterScreen(viewModel: RegisterViewModel(
        authRepository: AuthRepository(
            networkService: NetworkService(),
            googleService: GoogleService(),
            userRepository: UserRepository(networkService: NetworkService())
        ),
        userService: UserService()))
}
