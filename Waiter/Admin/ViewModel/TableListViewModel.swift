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
    var tableSections: [TableSection] = []
    var space = Space.veranda
    
    init() {
        fetchAllTables()
    }
    
    func fetchAllTables() {
        tableSections.removeAll()
        Task {
            let tables = try await FirestoreService.fetchTables()
            await MainActor.run {
                self.tables = tables
            }
            for table in tables {
                if let index = tableSections.firstIndex(where: { $0.space == table.space }) {
                    await MainActor.run {
                        tableSections[index].tablePosition.append(table)
                    }
                } else {
                    let section = TableSection(space: table.space, tablePosition: [table])
                    await MainActor.run {
                        self.tableSections.append(section)
                    }
                }
            }
        }
    }
    
    func createTable(number: Int) {
        Task {
            if let index = tableSections.firstIndex(where: { section in
                section.space == self.space
            }) {
                guard !tableSections[index].tablePosition.contains(where: { $0.number == number }) else { return }
                try await FirestoreService.createTable(.init(number: number, space: self.space))
                fetchAllTables()
            } else {
                try await FirestoreService.createTable(.init(number: number, space: self.space))
                fetchAllTables()
            }
        }
    }
    
    func deleteTable(table: Table) {
        Task {
            try await FirestoreService.deleteTable(table)
            fetchAllTables()
        }
    }
    
    func signOut() async -> Bool {
        await AuthService.signOut()
    }
}
