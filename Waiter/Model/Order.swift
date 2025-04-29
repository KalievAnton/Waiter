//
//  Order.swift
//  Waiter
//
//  Created by Влад Мади on 03.04.2025.
//

import Foundation
import Firebase

struct Order: Identifiable {
    let id: String
    var positions: [OrderPosition]
    let waiterID: String
    let tableID: String
    let date: Date
    
    var cost: Int { positions.count > 0 ? positions.reduce(0) { $0 + $1.cost } : 0 }
    
    init(id: String = UUID().uuidString, positions: [OrderPosition], waiterID: String, tableID: String, date: Date = .now) {
        self.positions = positions
        self.waiterID = waiterID
        self.tableID = tableID
        self.date = date
        self.id = id
    }
    
    init?(data: [String: Any]) {
        guard let waiterID = data["waiterID"] as? String,
              let tableID = data["tableID"] as? String,
              let dateData = data["date"] as? Timestamp,
              let id = data["id"] as? String else { return nil }
        self.waiterID = waiterID
        self.tableID = tableID
        self.date = dateData.dateValue()
        self.id = id
        self.positions = []
    }
    
    
}

extension Order {
    var representation: [String: Any] {
        var repr = [String: Any]()
        repr["id"] = id
        repr["waiterID"] = waiterID
        repr["tableID"] = tableID
        repr["date"] = Timestamp(date: date)
        return repr
    }
}





