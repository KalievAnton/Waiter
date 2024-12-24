//
//  TxtTableCell.swift
//  Waiter
//
//  Created by Тони on 24.12.2024.
//

import SwiftUI

struct TxtTableCell: ViewModifier {
    var isPadding: Bool = true
    var isFont: Bool = true
    func body(content: Content) -> some View {
        content
            .font(isFont ? .custom("Montserrat-Regular", size: 16) : .custom("Montserrat-Bold", size: 16))
            .foregroundColor(Color.black)
            .padding(isPadding ? 12 : 0)
    }
}
