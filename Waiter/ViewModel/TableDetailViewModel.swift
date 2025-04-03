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
    var searchText: String = ""
    var totalDishDescription: String { "\(total) ₽" }
    var total: Int { 0 }
    
    init(table: Table) {
        self.table = table
        fetchData()
    }
    
    func fetchData() {
        
    }
}
