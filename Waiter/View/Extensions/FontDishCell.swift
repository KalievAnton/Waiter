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
            .font(isFont ? .custom("Montserrat-Regular", size: 16) : .custom("Montserrat-Bold", size: 16))
    }
}

