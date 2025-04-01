//
//  Table.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import Foundation

class Table: Identifiable {
    let id: String = UUID().uuidString
    var number: Int
    var guest: Int = 0
    var dishes: [Dish] = []
    var isTable: Bool { guest == 0 }
    
   init(number: Int = 0) {
        self.number = number
   }
}
