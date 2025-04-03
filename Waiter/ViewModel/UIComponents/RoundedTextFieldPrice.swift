//
//  RoundedTextFieldPrice.swift
//  Waiter
//
//  Created by Anton Kaliev on 02.04.2025.
//

import SwiftUI

struct RoundedTextFieldPrice: View {
    @Binding var value: Int
    let placeholder: String
    var format: any ParseableFormatStyle = .number
    
    init(placeholder: String, value: Binding<Int>, format: any ParseableFormatStyle) {
        self.placeholder = placeholder
        _value = value
        self.format = format
    }
    
    var body: some View {
        TextField(placeholder, value: $value, format: .number)
            .padding(.horizontal, 20)
            .font(Font.custom(.regularMontserrat, size: 16))
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    RoundedTextFieldPrice(placeholder: "", value: .constant(0), format: .number)
}
