//
//  OTPInputView.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct OTPInputView: View {
    
    @Binding var code: String
    private let codeLength = 6
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ZStack {
            TextField("", text: $code)
                .keyboardType(.numberPad)
                .textContentType(.oneTimeCode)
                .focused($isFocused)
                .opacity(0.001)
                .frame(height: 50)
                .onChange(of: code) { oldValue, newValue in
                    if newValue.count > codeLength {
                        code = String(newValue.prefix(codeLength))
                    }
                }
            
            HStack(spacing: 4) {
                ForEach(0..<codeLength, id: \.self) { index in
                    let char = code[safe: index]
                    let isFocused = index == code.count && isFocused
                    
                    ZStack {
                        Color.clear
                            .animeCardBackgroundModifier(fillOpacity: 1)
                            .textFieldFocusModifier(isFocused)
                        
                        if let char {
                            Text(String(char))
                                .font(.system(.title, weight: .bold))
                                .foregroundStyle(.white)
                                
                        }
                        
                    }
                    .frame(height: 55)
                }
            }
            .allowsHitTesting(false)
            .frame(maxWidth: .infinity)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            isFocused = true
        }
    }
}

#Preview {
    @Previewable @State var code = "12345"
    OTPInputView(code: $code)
}
