//
//  FontDishCell.swift
//  Waiter
//
//  Created by Тони on 24.12.2024.
//

import SwiftUI

struct FontDishCell: ViewModifier {
    var isFont: Bool = true
    func body(content: Content) -> some View {
        content
            .font(isFont ? Font.custom(.regularMontserrat, size: 16) : Font.custom(.boldMontserrat, size: 16))
    }
}

