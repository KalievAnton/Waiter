//
//  TableListViewModel.swift
//  Waiter
//
//  Created by Влад Мади on 08.04.2025.
//

import Foundation

@Observable
class TableListViewModel {
    var tables: [Table] = []
    
    init() {
        fetchAllTables()
    }
    
    func fetchAllTables() {
        Task {
            let tables = try await FirestoreService.fetchTables()
            await MainActor.run {
                self.tables = tables
            }
        }
    }
    
    func createTable(number: Int) {
        Task {
            try await FirestoreService.createTable(.init(number: number))
            fetchAllTables()
        }
    }
}
