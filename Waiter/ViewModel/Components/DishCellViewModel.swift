//
//  DishCellViewModel.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import Foundation

@Observable
class DishCellViewModel {
    var dish: Dish
    var priceDescription: String { "\(dish.price) ₽" }
    var amountDescription: String { "\(dish.amount) шт" }
    var sumDishes: Int { dish.amount * dish.price }
    var sumDescription: String { "\(sumDishes) ₽" }
    
    init(dish: Dish) {
        self.dish = dish
    }
}
