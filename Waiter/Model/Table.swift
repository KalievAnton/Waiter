//
//  Table.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import Foundation

class Table: Identifiable {
    let id: String = UUID().uuidString
    var number: Int = 0
    let isTable: Bool
    var guest: Int = 0
    var dishes: [Dish]
    var cash: Int {
        dishes.reduce(0) { $0 + $1.price * $1.amount }
    }
    
   init(number: Int = 0, isTable: Bool = true, guest: Int = 0, dishes: [Dish] = []) {
        self.number = number
       self.isTable = isTable
        self.guest = guest
        self.dishes = dishes
    }
}
