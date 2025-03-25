//
//  RoundedButton.swift
//  Waiter
//
//  Created by Anton Kaliev on 12.03.2025.
//

import SwiftUI

struct RoundedButton: View {
    let text: String
    let isBold: Bool = true
    let bgColor: Color = .buttonColor
    let tintColor: Color = .white
    let action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .font(isBold ? Font.custom(.mediumMontserrat, size: 17) : Font.custom(.boldMontserrat, size: 17))
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                .background {
                    isBold ? Color.buttonColor : Color.clear
                }
                .foregroundStyle(tintColor)
                .clipShape(.rect(cornerRadius: 10))
        }
    }
}

#Preview {
    RoundedButton(text: "Кнопка", action: { })
}
