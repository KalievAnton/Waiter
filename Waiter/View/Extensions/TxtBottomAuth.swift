//
//  TxtBottomAuth.swift
//  Waiter
//
//  Created by Тони on 24.12.2024.
//

import SwiftUI

struct TxtBottomAuth: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Montserrat-Regular", size: 16))
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .multilineTextAlignment(.center)
    }
}
