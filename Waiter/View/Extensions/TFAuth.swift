//
//  TFAuth.swift
//  Waiter
//
//  Created by Тони on 24.12.2024.
//
import SwiftUI

struct TFAuth: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(12)
            .font(.custom("Montserrat-Regular", size: 16))
            .multilineTextAlignment(.center)
            .background(ignoresSafeAreaEdges: .all)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
