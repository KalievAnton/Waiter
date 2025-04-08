//
//  CategoryListViewModel.swift
//  Waiter
//
//  Created by Влад Мади on 03.04.2025.
//

import Foundation

@Observable
class CategoryListViewModel {
    var categories: [DishCategory] = []
    
    init() {
        fetchAllCategories()
    }
    
    func fetchAllCategories() {
        Task {
            let categories = try await FirestoreService.getAllCategories()
            await MainActor.run {
                self.categories = categories
            }
        }
    }
}
