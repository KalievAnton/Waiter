//
//  Profile.swift
//  Waiter
//
//  Created by Anton Kaliev on 12.03.2025.
//

import Foundation

class Profile: Identifiable {
    let id: String
    var name: String
    var email: String
    let role: Role
    
    init(id: String = UUID().uuidString, name: String, email: String, role: Role) {
        self.id = id
        self.name = name
        self.email = email
        self.role = role
    }
}

enum Role: String, CaseIterable {
    case admin 
    case owner
    case waiter
    case chef
    
    var label: String {
        switch self {
        case .admin: return "Администратор"
        case .owner: return "Владелец"
        case .waiter: return "Официант"
        case .chef: return "Повар"
        }
    }
}

extension Profile {
    var representation: [String: Any] {
        ["id": id,
         "name": name,
         "email": email,
         "role": role.rawValue]
    }
}

extension Profile {
    convenience init?(_ data: [String: Any]) {
        guard let id = data["id"] as? String,
              let name = data["name"] as? String,
              let email = data["email"] as? String,
              let roleString = data["role"] as? String else { return nil }
        
        guard let role = Role(rawValue: roleString) else { return nil }
        self.init(id: id, name: name, email: email, role: role)
    }
}
