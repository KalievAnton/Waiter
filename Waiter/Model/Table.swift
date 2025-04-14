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
    var space: Space
    var order: [OrderPosition] = []
    var isTable: Bool { guest == 0 }
    
    init(id: String = UUID().uuidString, number: Int = 0, space: Space = .veranda) {
        self.id = id
        self.number = number
        self.space = space
    }
}

enum Space: String, CaseIterable {
    case veranda
    case nall1
    case nall2
    
    var label: String {
        switch self {
        case .veranda: return "Веранда"
        case .nall1: return "Зал 1"
        case .nall2: return "Зал 2"
        }
    }
}

extension Table {
    convenience init?(data: [String: Any]) {
        guard let id = data["id"] as? String,
              let number = data["number"] as? Int,
              let spaceString = data["space"] as? String else { return nil }
        
        guard let space = Space(rawValue: spaceString) else { return nil }
        self.init(id: id, number: number, space: space)
    }
}

extension Table {
    var representation: [String : Any] {
        var represent: [String: Any] = [:]
        represent["id"] = id
        represent["number"] = number
        represent["guest"] = guest
        represent["space"] = space.rawValue
        return represent
    }
}
