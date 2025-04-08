//
//  DishCategory.swift
//  Waiter
//
//  Created by Влад Мади on 03.04.2025.
//

import Foundation

struct DishCategory: Identifiable, Hashable {
    let id: String
    var title: String
}

extension DishCategory {
    var representation: [String : Any] {
        [
            "id": id,
            "title": title
        ]
    }
}

extension DishCategory {
    init?(_ data: [String : Any]) {
        guard let id = data["id"] as? String,
              let title = data["title"] as? String else { return nil }
        
        self.init(id: id, title: title)
    }
}
