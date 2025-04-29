//
//  OrderDetailsViewModel.swift
//  Waiter
//
//  Created by Влад Мади on 29.04.2025.
//

import Foundation

@Observable
class OrderDetailsViewModel {
    var order: Order
    var waiterName: String?
    var table: Table?
    
    init?(order: Order?) {
        guard let order else { return nil }
        self.order = order
        getPositions()
        getWaiterName()
        getTable()
    }
    
    func getPositions() {
        Task {
            let positions = try await FirestoreService.getOrder(byID: order.id).positions
            await MainActor.run {
                self.order.positions = positions
                print(self.order.positions.count)
            }
        }
    }
    
    func getWaiterName() {
        Task {
            let name = try await FirestoreService.fetchProfile(id: order.waiterID).name
            await MainActor.run { waiterName = name }
        }
    }
    
    func getTable() {
        Task {
            let table = try await FirestoreService.fetchTable(byID: order.tableID)
            await MainActor.run { self.table = table }
        }
    }
    
}
