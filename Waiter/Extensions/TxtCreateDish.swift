//
//  TxtCreateDish.swift
//  Waiter
//
//  Created by Anton Kaliev on 02.04.2025.
//

import SwiftUI

struct TxtCreateDish: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 50)
            .padding(.horizontal, 20)
            .font(Font.custom(.regularMontserrat, size: 16))
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
