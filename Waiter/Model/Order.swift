//
//  Order.swift
//  Waiter
//
//  Created by Влад Мади on 03.04.2025.
//

import Foundation

class Order: Identifiable {
    let id: String = UUID().uuidString
    var positions: [OrderPosition] = []
    var cost: Int { positions.count > 0 ? positions.reduce(0) { $0 + $1.cost } : 0 }
}
