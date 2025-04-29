//
//  OrderDetailView.swift
//  Waiter
//
//  Created by Влад Мади on 29.04.2025.
//

import SwiftUI

struct OrderDetailView: View {
    @State var viewModel: OrderDetailsViewModel
    
    var body: some View {
        Form {
            Text(viewModel.order.date.formatted(date: .numeric, time: .standard))
            Text("Официант: \(viewModel.waiterName ?? "Неизвестен")")
            Text("Зона: \(viewModel.table?.space.rawValue ?? "Не задана")")
            Text("Стол № \(viewModel.table?.number ?? 0)")
        }
        .frame(maxHeight: 220)
        List(viewModel.order.positions) { pos in
            HStack(spacing: 8) {
                Text(pos.title)
                Spacer()
                Text("\(pos.count) шт.")
                Text("Сумма: \(pos.cost)₽")
            }
        }
    }
}
