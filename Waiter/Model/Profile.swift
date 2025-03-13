//
//  Profile.swift
//  Waiter
//
//  Created by Anton Kaliev on 12.03.2025.
//

import Foundation

class Profile: Identifiable {
    let id: String
    let name: String
    let phone: Int
    let role: Role
    
    init(id: String = UUID().uuidString, name: String, phone: Int, role: Role) {
        self.id = id
        self.name = name
        self.phone = phone
        self.role = role
    }
}

enum Role {
    case admin(owner: Bool)
    case waiter
    case chef
    
    var label: String {
        switch self {
        case .admin: return true ? "Администратор" : "Владелец"
        case .waiter: return "Официант"
        case .chef: return "Повар"
        }
    }
}
