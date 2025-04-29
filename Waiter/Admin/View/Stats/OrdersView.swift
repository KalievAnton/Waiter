//
//  OrdersView.swift
//  Waiter
//
//  Created by Влад Мади on 29.04.2025.
//

import SwiftUI

struct OrdersListView: View {
    @State var viewModel = OrdersViewModel()
    @State var showOrderDetails = false
    
    var body: some View {
        List(viewModel.orders) { order in
            Text(order.date.formatted(date: .numeric, time: .shortened))
                .onTapGesture {
                    viewModel.selectedOrder = order
                    showOrderDetails.toggle()
                }
            
        }
        .sheet(isPresented: $showOrderDetails) {
            viewModel.selectedOrder = nil
        } content: {
            OrderDetailView(viewModel: OrderDetailsViewModel(order: viewModel.selectedOrder)!)
        }
    }
}

#Preview {
    OrdersListView()
}
