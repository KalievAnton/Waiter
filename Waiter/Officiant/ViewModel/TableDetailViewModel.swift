//
//  TableDetailViewModel.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import Foundation

@Observable
class TableDetailViewModel {
    var productsVM = ProductCollectionVM()
    var table: Table
    var searchText: String = ""
    var totalDishDescription: String { "\(total) ₽" }
    var total: Int {
        table.order.reduce(0) { partialResult, pos in
            partialResult + pos.cost
        }
    }
    
    init(table: Table) {
        self.table = table
    }
    
    func addPosition(dish: Dish) {
        self.table.order.append(OrderPosition(id: UUID().uuidString, productID: dish.id, title: dish.title, price: dish.price, count: 1))
    }
    
   
}

class ProductCollectionVM {
    var dishes: [Dish] = []
    var categories: [DishCategory] = []
    var sections: [CategorySection] = []
    var searchedDishes = [Dish]()
    var searchText = ""

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
    
    func search() {
        guard !self.searchText.isEmpty else {
            self.searchedDishes = self.dishes
            self.divideBySections()
            return
        }
        self.searchedDishes = self.dishes.filter({ dish in
            dish.title.lowercased().contains(self.searchText.lowercased())
        })
        self.divideBySections()
    }
    
    func getCategoryTitleBy(categoryID id: String) -> String? {
        guard let category = self.categories.first(where: { $0.id == id }) else { return nil }
        return category.title
    }
}
