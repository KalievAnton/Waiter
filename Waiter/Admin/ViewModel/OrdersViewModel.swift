//
//  OrdersViewModel.swift
//  Waiter
//
//  Created by Влад Мади on 29.04.2025.
//

import Foundation

@Observable
class OrdersViewModel {
    var orders: [Order] = []
    var selectedOrder: Order?
    
    init() {
        getAllOrders()
    }
    
    func getAllOrders() {
        Task {
            let orders = try await FirestoreService.getAllOrders()
            await MainActor.run { self.orders = orders }
        }
    }
}
