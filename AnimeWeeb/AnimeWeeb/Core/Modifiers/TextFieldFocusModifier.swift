//
//  TextFieldFocusModifier.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation
import SwiftUI

struct TextFieldFocusModifier: ViewModifier {
    
    var isFocused: Bool
    
    func body(content: Content) -> some View {
        content
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(isFocused ? .focusedStroke : .stroke, lineWidth: 1)
                    
            }
            .padding(2)
            .overlay {
                RoundedRectangle(cornerRadius: 13)
                    .strokeBorder(isFocused ? .focusedSecondStroke : .clear, lineWidth: 2)
            }
    }
}

extension View {
    func textFieldFocusModifier(_ isFocused: Bool) -> some View {
        modifier(TextFieldFocusModifier(isFocused: isFocused))
    }
}
