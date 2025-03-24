//
//  RoundedTextField.swift
//  Waiter
//
//  Created by Anton Kaliev on 13.03.2025.
//

import SwiftUI

struct RoundedTextField: View {
    @Binding var text: String
    let placeholder: String
    var hasEye: Bool = false
    @State var isSecure: Bool
    
    init(text: Binding<String>, placeholder: String, hasEye: Bool) {
        _text = text
        self.placeholder = placeholder
        self.hasEye = hasEye
        self.isSecure = hasEye
    }
    
    var body: some View {
        HStack {
            if hasEye {
                HStack {
                    if isSecure {
                        SecureField(placeholder, text: $text)
                            .frame(height: 50)
                    } else {
                        TextField(placeholder, text: $text)
                            .frame(height: 50)
                    }
                }
                .overlay(alignment: .trailing) {
                    Button {
                        isSecure.toggle()
                    } label: {
                        Image(systemName: isSecure ?  "eye" : "eye.slash")
                            .foregroundStyle(.black)
                    }
                }
            } else {
                TextField(placeholder, text: $text)
                    .frame(height: 50)
            }
        }
        .padding(.horizontal, 20)
            .font(Font.custom(.regularMontserrat, size: 16))
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    RoundedTextField(text: .constant("Пароль от почты"), placeholder: "", hasEye: true)
}
