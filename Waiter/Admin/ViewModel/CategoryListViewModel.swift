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
    
    func createCategory(title: String) {
        Task {
            guard categories.contains(where: { $0.title.isEmpty == title.isEmpty }) else { return }
            guard !categories.contains(where: { $0.title.lowercased() == title.lowercased() }) else { return }
            try await FirestoreService.setDishCategory(.init(title: title))
            fetchAllCategories()
        }
    }
}
