//
//  TxtBottomAuth.swift
//  Waiter
//
//  Created by Тони on 24.12.2024.
//

import SwiftUI

struct TxtBottomAuth: ViewModifier {
    var padding: EdgeInsets
    func body(content: Content) -> some View {
        content
            .font(Font.custom(.regularMontserrat, size: 16))
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .multilineTextAlignment(.center)
    }
}
