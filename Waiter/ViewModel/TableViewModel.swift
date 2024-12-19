//
//  TableViewModel.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import Foundation

@Observable
class TableViewModel {
    var user: User
    var table: [Table] = [
        .init(number: 1, isTable: true,guest: 0, dishes: []),
        .init(number: 2, isTable: false, guest: 3, dishes: []),
        .init(number: 3, isTable: false, guest: 6, dishes: []),
        .init(number: 4, isTable: true, guest: 0, dishes: []),
    ]
    
    var totalTableDescription: String { "\(total) ₽"}
    var total: Int {
       table.reduce(0) { $0 + $1.cash }
    }
    
    init(user: User) {
        self.user = user
    }
}
