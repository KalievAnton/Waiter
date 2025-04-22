//
//  TableDetailViewModel.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import Foundation

@Observable
class TableDetailViewModel {
    var dishes: [Dish] = []
    var categories: [DishCategory] = []
    var table: Table
    var searchText: String = ""
    var totalDishDescription: String { "\(total) ₽" }
    var total: Int { 0 }
    
    init(table: Table) {
        self.table = table
        fetchDishes()
    }
    
    func fetchDishes() {
        Task {
            let dishes = try await FirestoreService.getAllDishes()
            await MainActor.run {
                self.dishes = dishes
            }
            let categories = try await FirestoreService.getAllCategories()
            await MainActor.run {
                self.categories = categories
            }
        }
    }
}
