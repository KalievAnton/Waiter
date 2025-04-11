//
//  Space.swift
//  Waiter
//
//  Created by Anton Kaliev on 09.04.2025.
//

import Foundation

struct Space: Identifiable {
    var id: String = UUID().uuidString
    var title: String
}

extension Space {
    var representation: [String : Any] {
        [
            "id": id,
            "title": title
        ]
    }
}

extension Space {
    init?(_ data: [String : Any]) {
        guard let id = data["id"] as? String,
              let title = data["title"] as? String else { return nil }
        
        self.init(id: id, title: title)
    }
}
