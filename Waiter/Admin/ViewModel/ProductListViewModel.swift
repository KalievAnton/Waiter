//
//  ProductListViewModel.swift
//  Waiter
//
//  Created by Влад Мади on 01.04.2025.
//

import Foundation

@Observable
class ProductListViewModel {
    var sections: [CategorySection] = []
    var categories: [DishCategory] = []
    
    init() {
        fetchDishes()
    }
    
    func fetchDishes() {
        sections.removeAll()
        Task {
            let categories = try await FirestoreService.getAllCategories()
            await MainActor.run {
                self.categories = categories
            }
            let dishes = try await FirestoreService.getAllDishes()
            for dish in dishes {
                if let index = sections.firstIndex(where: { $0.categoryID == dish.category }) {
                    await MainActor.run {
                        sections[index].dishes.append(dish)
                    }
                } else {
                    await MainActor.run {
                        sections.append(CategorySection(categoryID: dish.category, dishes: [dish]))
                    }
                }
            }
        }
    }
    
    func getCategoryTitleBy(categoryID id: String) -> String? {
        guard let category = categories.first(where: { $0.id == id }) else { return nil }
        return category.title
    }
    
}

struct CategorySection {
    let categoryID: String
    var dishes: [Dish] = []
}
