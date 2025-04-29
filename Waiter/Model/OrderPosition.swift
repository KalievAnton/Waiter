//
//  OrderPosition.swift
//  Waiter
//
//  Created by Влад Мади on 01.04.2025.
//

import Foundation

class OrderPosition: Identifiable {
    var id: String
    let productID: String
    let title: String
    let price: Int
    var count: Int
    var cost: Int { price * count }
    
    init(id: String = UUID().uuidString, productID: String, title: String, price: Int, count: Int) {
        self.id = id
        self.productID = productID
        self.title = title
        self.price = price
        self.count = count
    }
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

extension OrderPosition: CustomStringConvertible {
    var description: String {  "\(id) - \(title) (\(count) x \(price))" }
}

extension OrderPosition {
    convenience init?(_ data: [String : Any]) {
        guard let id = data["id"] as? String,
              let productID = data["productID"] as? String,
              let price = data["price"] as? Int,
              let count = data["count"] as? Int,
              let title = data["title"] as? String else { return nil }
        
        self.init(id: id, productID: productID, title: title, price: price, count: count)
    }
}
