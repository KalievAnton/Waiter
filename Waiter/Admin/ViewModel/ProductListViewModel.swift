//
//  ProductListViewModel.swift
//  Waiter
//
//  Created by Влад Мади on 01.04.2025.
//

import Foundation

@Observable
class ProductListViewModel {
    var productsVM = ProductCollectionVM()
    var currentDish: Dish = Dish(title: "", price: 0, description: "", volume: "", category: "")
    var selectedCategory: DishCategory? = nil
    
    init() {
        
    }

    func selectCategory(_ selected: DishCategory? = nil) {
        self.selectedCategory = selected
        guard let selectedCategory else {
            productsVM.searchedDishes = productsVM.dishes
            productsVM.divideBySections()
            return
        }
        productsVM.searchedDishes = productsVM.dishes.filter {
            $0.category == selectedCategory.id
        }
        productsVM.divideBySections()
    }
}
