//
//  DishCell.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import SwiftUI

struct DishCell: View {
    @Bindable var viewModel: DishCellViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(viewModel.position.title)
                    .fontDishCellFalseStyle()
                Stepper("Кол-во", value: $viewModel.position.count, in: 1...20, step: 1)
            }
            HStack(spacing: 100) {
                Text(viewModel.priceDescription)
                    .fontDishCellTrueStyle()
                Text(viewModel.amountDescription)
                    .fontDishCellTrueStyle()
                Text(viewModel.sumDescription)
                    .fontDishCellTrueStyle()
            }
            .padding(.top)
        }
        .frame(maxWidth: .infinity, maxHeight: 80)
        .padding()
        .background(Color.tableGreen)
        .clipShape(.rect(cornerRadius: 20))
    }
}

//#Preview {
//    DishCell(viewModel: .init(dish: Dish.mockData[2]))
//}
