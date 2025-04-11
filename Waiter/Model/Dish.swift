//
//  Dish.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import Foundation

class Dish: Identifiable {
    let id: String
    var title: String
    let price: Int
    let description: String
    let volume: String
    let category: String
    
    init(id: String = UUID().uuidString,
         title: String,
         price: Int,
         description: String,
         volume: String,
         category: String) {
        self.id = id
        self.title = title
        self.price = price
        self.description = description
        self.volume = volume
        self.category = category
    }
}

extension Dish {
    var representation: [String : Any] {
        var represent: [String : Any] = [:]
            represent["id"] = id
            represent["title"] = title
            represent["price"] = price
            represent["description"] = description
            represent["volume"] = volume
            represent["category"] = category
            return represent
    }
}

extension Dish {
    convenience init?(_ data: [String: Any]) {
        guard let id = data["id"] as? String,
              let title = data["title"] as? String,
              let price = data["price"] as? Int,
              let description = data["description"] as? String,
              let volume = data["volume"] as? String,
              let category = data["category"] as? String else { return nil }
        
        
        self.init(id: id,
                  title: title,
                  price: price,
                  description: description,
                  volume: volume,
                  category: category)
    }
}
