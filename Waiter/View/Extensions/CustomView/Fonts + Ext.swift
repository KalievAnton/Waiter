//
//  CustomFonts.swift
//  Waiter
//
//  Created by Тони on 02.01.2025.
//

import SwiftUI

enum CustomFonts: String {
    case regularMontserrat = "Montserrat-Regular"
    case boldMontserrat = "Montserrat-Bold"
}

extension Font {
    static func custom(_ fontName: CustomFonts, size: Double) -> Font {
        Font.custom(fontName.rawValue, size: size)
    }
}


