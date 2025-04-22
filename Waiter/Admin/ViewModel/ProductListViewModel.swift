//
//  ProductListViewModel.swift
//  Waiter
//
//  Created by Влад Мади on 01.04.2025.
//

import Foundation

@Observable
class ProductListViewModel {
    var dishes = [Dish]()
    var searchedDishes = [Dish]()
    var sections: [CategorySection] = []
    var categories: [DishCategory] = []
    var currentDish: Dish = Dish(title: "", price: 0, description: "", volume: "", category: "")
    var searchText = ""
    var selectedCategory: DishCategory? = nil
    
    init() {
        fetchDishes()
    }
    
    func fetchDishes() {
        Task {
            let categories = try await FirestoreService.getAllCategories()
            await MainActor.run {
                self.categories = categories
            }
            let dishes = try await FirestoreService.getAllDishes()
            await MainActor.run {
                self.dishes = dishes
                self.searchedDishes = dishes
                divideBySections()
            }
        }
    }
    
    func divideBySections() {
        sections.removeAll()
        for dish in searchedDishes {
            if let index = sections.firstIndex(where: { $0.categoryID == dish.category }) {
                sections[index].dishes.append(dish)
            } else {
                sections.append(CategorySection(categoryID: dish.category, dishes: [dish]))
            }
        }
    }
    
    func getCategoryTitleBy(categoryID id: String) -> String? {
        guard let category = categories.first(where: { $0.id == id }) else { return nil }
        return category.title
    }
    
    func selectCategory(_ selected: DishCategory? = nil) {
        self.selectedCategory = selected
        guard let selectedCategory else {
            self.searchedDishes = self.dishes
            return
        }
        self.searchedDishes = self.dishes.filter {
            $0.category == selectedCategory.id
        }
        divideBySections()
    }
    
    func search() {
        guard !searchText.isEmpty else {
            self.searchedDishes = self.dishes
            divideBySections()
            return
        }
        self.searchedDishes = self.dishes.filter({ dish in
            dish.title.lowercased().contains(self.searchText.lowercased())
        })
        divideBySections()
    }
}
