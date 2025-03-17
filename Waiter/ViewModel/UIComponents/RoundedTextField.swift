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
    
    init(text: Binding<String>, placeholder: String) {
       _text = text
        self.placeholder = placeholder
    }
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding(10)
            .font(Font.custom(.regularMontserrat, size: 16))
            .frame(height: 50)
            .multilineTextAlignment(.center)
            .background(ignoresSafeAreaEdges: .all)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
#Preview {
    RoundedTextField(text: .constant("Номер телефона"), placeholder: "")
}
