//
//  EmailTextField.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct EmailTextField: View {

    @Binding var email: String
    @FocusState var isTextFieldFocused: Bool

    var body: some View {
        TextField(
            "",
            text: $email,
            prompt: Text("Email")
                .font(.body)
                .foregroundStyle(.genreText)
        )
        .keyboardType(.emailAddress)
        .textContentType(.emailAddress)
        .textInputAutocapitalization(.never)
        .autocorrectionDisabled()
        .focused($isTextFieldFocused)
        .font(.body)
        .frame(height: 50)
        .padding(.horizontal)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.background)
        )
        .contentShape(Rectangle())
        .onTapGesture {
            isTextFieldFocused = true
        }
        .textFieldFocusModifier(isTextFieldFocused)
    }
}
