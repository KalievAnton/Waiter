//
//  TFBottomTotalTable.swift
//  Waiter
//
//  Created by Тони on 24.12.2024.
//

import SwiftUI

struct TFBottomTotalTable: ViewModifier {
    var padding: EdgeInsets
    func body(content: Content) -> some View {
        content
            .font(.custom("Montserrat-Bold", size: 24))
            .foregroundStyle(.white)
    }
}
