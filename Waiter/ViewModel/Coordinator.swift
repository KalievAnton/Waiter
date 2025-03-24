//
//  Coordinator.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import Foundation

@Observable
final class Coordinator {
    let user = Users()
    var appState: AppState = .unauthorized
    let adminID: String = "bm6rxNlHhUXhIUFrXUj6xO7BWeD3"
    
    init() {
        if let currentUser = AuthService.currentUser {
            if currentUser.uid == adminID {
                appState = .adminpanel
            } else {
                appState  = .authorized(userID: currentUser.uid)
            }
        } else {
            appState = .unauthorized
        }
    }
}
