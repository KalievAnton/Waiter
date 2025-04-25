//
//  TablesViewModel.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import Foundation

@Observable
class TablesViewModel {
    var profile: Profile?
    var tables: [Table] = []
    
    var totalTableDescription: String { "МНОГА ₽"}
//    var total: Int {
//        tables.reduce(0) { $0 + $1.order.cost }
//    }
    
    init(userID: String) {
        getTables()
        getProfile(userID: userID)
    }
    
    func getTables() {
        Task {
            let tables = try await FirestoreService.fetchTables()
            await MainActor.run {
                self.tables = tables
            }
        }
    }
    
    func getProfile(userID: String) {
        Task {
            let profile = try await FirestoreService.fetchProfile(id: userID)
            await MainActor.run {
                self.profile = profile
            }
        }
    }
    
  
}
