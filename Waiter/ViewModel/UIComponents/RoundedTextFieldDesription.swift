//
//  RoundedTextFieldDesription.swift
//  Waiter
//
//  Created by Anton Kaliev on 02.04.2025.
//

import SwiftUI

struct RoundedTextFieldDesription: View {
    @Binding var text: String
    let placeholder: String
    
    init(text: Binding<String>, placeholder: String) {
        _text = text
        self.placeholder = placeholder
    }
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding(.horizontal, 20)
            .font(Font.custom(.regularMontserrat, size: 16))
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    RoundedTextFieldDesription(text: .constant(""), placeholder: "")
}
