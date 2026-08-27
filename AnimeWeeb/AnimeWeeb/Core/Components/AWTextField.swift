//
//  AWTextField.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct AWTextField: View {

    @Binding var text: String
    let placeholder: String
    @FocusState var isTextFieldFocused: Bool

    var body: some View {
        TextField(
            "",
            text: $text,
            prompt: Text(placeholder)
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
