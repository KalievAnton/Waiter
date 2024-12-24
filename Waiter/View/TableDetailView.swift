//
//  TableDetailView.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import SwiftUI

struct TableDetailView: View {
    @State var viewModel: TableDetailViewModel
    @Bindable var tableVM: TableViewModel
    let layout: [GridItem] = [.init()]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: layout) {
                    ForEach(viewModel.table.dishes) { dish in
                        DishCell(viewModel: .init(dish: dish))
                    }
                }
            }
            HStack {
                Text("ИТОГО:")
                    .tfBottomTotalTableStyle().padding(.leading, 16)
                Spacer()
                Text(viewModel.totalDishDescription)
                    .tfBottomTotalTableStyle().padding(.trailing, 16)
            }
        }
        .background {
            Image(.bg)
                .resizable()
                .ignoresSafeArea()
                .scaleEffect()
        }
        .onDisappear {
           guard let index = tableVM.table.firstIndex (where: { table in
                viewModel.table.id == table.id
            }) else { return }
            tableVM.table[index] = viewModel.table
        }
    }
}

#Preview {
    TableDetailView(viewModel: .init(table: .init()), tableVM: .init(user: .init()))
}
