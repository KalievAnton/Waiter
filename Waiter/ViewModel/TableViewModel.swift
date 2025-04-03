//
//  TableViewModel.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import Foundation

@Observable
class TableViewModel {
    var profile: Profile?
    var tables: [Table] = [ ]
    
    var totalTableDescription: String { "\(total) ₽"}
    var total: Int {
        tables.reduce(0) { $0 + $1.order.cost }
    }
    
    init(userID: String) {
        Task {
            //get profile
        }
    }
}
