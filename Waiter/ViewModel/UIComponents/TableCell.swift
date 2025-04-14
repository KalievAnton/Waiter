//
//  TableCell.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import SwiftUI

struct TableCell: View {
    @State var viewModel: TableCellViewModel
    
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                Text(viewModel.numberDesciption)
                    .txtTableCellFalseStyle()
                Group {
                    if viewModel.table.isTable {
                        Text("Свободен")
                            .txtTableCellTrueStyle()
                    } else {
                        Text(viewModel.guestDescription)
                            .txtTableCellTrueStyle()
                        Text(viewModel.cashDescription)
                            .txtTableCellTotalStyle()
                    }
                }
            }
            .frame(minWidth: 190, minHeight: 180)
        }
    }
}

#Preview {
    TableCell(viewModel: .init(table: Table(space: .nall1)))
}
