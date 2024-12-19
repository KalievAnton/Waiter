//
//  DishCell.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import SwiftUI

struct DishCell: View {
    var viewModel: DishCellViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.dish.title)
                .font(.custom("Montserrat-Bold", size: 16))
            HStack(spacing: 100) {
                Text(viewModel.priceDescription)
                    .font(.custom("Montserrat-Regular", size: 16))
                Text(viewModel.amountDescription)
                    .font(.custom("Montserrat-Regular", size: 16))
                Text(viewModel.sumDescription)
                    .font(.custom("Montserrat-Regular", size: 16))
            }
            .padding(.top)
        }
        .frame(width: 350, height: 80)
        .padding()
        .background(Color.table1)
        .clipShape(.rect(cornerRadius: 20))
    }
}

#Preview {
    DishCell(viewModel: .init(dish: Dish.mockData[0]))
}
