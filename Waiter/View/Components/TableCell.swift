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
                    .font(.custom("Montserrat-Bold", size: 16))
                    .foregroundColor(Color.black)
                Group {
                    if viewModel.isFree {
                        Text("Свободен")
                            .customStyle()
                            .padding(12)
                    } else {
                        Text(viewModel.guestDescription)
                            .customStyle()
                            .padding(12)
                        Text(viewModel.cashDescription)
                            .customStyle()
                    }
                }
            }
            
            .frame(maxWidth: .infinity, minHeight: 180)
        }
    }
}

struct StyleViewModifire: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Montserrat-Regular", size: 16))
            .foregroundColor(Color.black)
    }
}

extension View {
    func customStyle() -> some View { modifier(StyleViewModifire()) }
}

#Preview {
    TableCell(viewModel: .init(table: Table(dishes: [])))
}
