//
//  CustomView + Ext.swift
//  Waiter
//
//  Created by Тони on 24.12.2024.
//

import SwiftUI

extension View {
    func tfBottomTotalTableStyle() -> some View { modifier(TFBottomTotalTable(padding: .init())) }
    func txtTableCellTrueStyle() -> some View { modifier(TxtTableCell(isPadding: true, isFont: true)) }
    func txtTableCellFalseStyle() -> some View { modifier(TxtTableCell(isPadding: false, isFont: false)) }
    func txtTableCellTotalStyle() -> some View { modifier(TxtTableCell(isPadding: false, isFont: true)) }
    func fontDishCellTrueStyle() -> some View { modifier(FontDishCell(isFont: true)) }
    func fontDishCellFalseStyle() -> some View { modifier(FontDishCell(isFont: false)) }
}
