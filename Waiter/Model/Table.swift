//
//  Table.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import Foundation

class Table: Identifiable {
    var id: String
    var number: Int
    var guest: Int = 0
    var order: [OrderPosition] = []
    var isTable: Bool { guest == 0 }
    
    init(id: String = UUID().uuidString, number: Int = 0) {
        self.number = number
        self.id = id
    }
}

extension Table {
    convenience init?(data: [String: Any]) {
        guard let id = data["id"] as? String,
              let number = data["number"] as? Int else { return nil }
        
        self.init(id: id, number: number)
    }
}

extension Table {
    var representation: [String : Any] {
        [
            "id": id,
            "number": number,
            "guest": guest,
        ]
    }
}

enum Space {
    
}
