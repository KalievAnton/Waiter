//
//  MainAdminViewModel.swift
//  Waiter
//
//  Created by Anton Kaliev on 22.03.2025.
//

import Foundation


@Observable
final class MainAdminViewModel {
    
    func signOut() async -> Bool {
        await AuthService.signOut()
    }
}
