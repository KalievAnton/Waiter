//
//  Coordinator.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import Foundation

@Observable
class Coordinator {
    let user = Users()
    var appState: AppState = .unauthorized
    
    init() {
        if let currenUser = AuthService.currentUser {
            if currenUser.uid == "" {
                appState = .authorized(userID: currenUser.uid)
            }
        } else {
            appState = .unauthorized
        }
    }
}
