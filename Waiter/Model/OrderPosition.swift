//
//  OrderPosition.swift
//  Waiter
//
//  Created by Влад Мади on 01.04.2025.
//

import Foundation

struct OrderPosition: Identifiable {
    var id: String = .init()
    let productID: String
    let title: String
    let price: Int
    var count: Int
    var cost: Int { price * count }
}

extension OrderPosition {
    var representation: [String : Any] {
        [
            "id": id,
            "productID": productID,
            "price": price,
            "count": count,
            "title": title
        ]
    }
}

extension OrderPosition {
    init?(_ data: [String : Any]) {
        guard let id = data["id"] as? String,
              let productID = data["productID"] as? String,
              let price = data["price"] as? Int,
              let count = data["count"] as? Int,
              let title = data["title"] as? String else { return nil }
        
        self.init(id: id, productID: productID, title: title, price: price, count: count)
    }
}
