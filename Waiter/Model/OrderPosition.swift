//
//  OrderPosition.swift
//  Waiter
//
//  Created by Влад Мади on 01.04.2025.
//

import Foundation

struct OrderPosition: Identifiable {
    let id: String = .init()
    let productID: String
    let price: Int
    var count: Int
}

extension OrderPosition {
    var representation: [String : Any] {
        [
            "id": id,
            "productID": productID,
            "price": price,
            "count": count
        ]
    }
}

extension OrderPosition {
    init?(_ data: [String : Any]) {
        guard let id = data["id"] as? String,
              let productID = data["productID"] as? String,
              let price = data["price"] as? Int,
              let count = data["count"] as? Int else { return nil }
        
        self.init(productID: productID, price: price, count: count)
    }
}
