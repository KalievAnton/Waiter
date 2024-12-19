//
//  TableDetailViewModel.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import Foundation

@Observable
class TableDetailViewModel {
    var dish: [Dish] = []
    var table: Table
    var totalDishDescription: String { "\(total) ₽" }
    var total: Int {
        table.dishes.reduce(0) { $0 + $1.amount * $1.price }
    }
    
    init(table: Table) {
        self.table = table
        fetchData()
    }
    
    func fetchData() {
        self.dish = Dish.mockData
    }
}
