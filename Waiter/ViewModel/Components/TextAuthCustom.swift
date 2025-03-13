//
//  TextAuthCustom.swift
//  Waiter
//
//  Created by Anton Kaliev on 12.03.2025.
//

import SwiftUI

struct TextAuthCustom: View {
    let text: String
    let isFont: Bool
    
    var body: some View {
        Text(text)
            .font(isFont ? Font.custom(.mediumMontserrat, size: 17) : Font.custom(.boldMontserrat, size: 50))
            .foregroundStyle(.white)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    TextAuthCustom(text: "", isFont: true)
}
