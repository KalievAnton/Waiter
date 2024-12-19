//
//  Coordinator.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import Foundation

@Observable
class Coordinator {
    let user = User()
    var appState: AppState = .unauthorized
}
