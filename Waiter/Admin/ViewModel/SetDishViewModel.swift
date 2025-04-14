//
//  SetDishViewModel.swift
//  Waiter
//
//  Created by Влад Мади on 15.04.2025.
//

import Foundation

protocol SetDishVM {
    var title: String { get set }
    var price: Int? { get set }
    var description: String { get set }
    var volume: String { get set }
    var dishCategories: [DishCategory] { get }
    var selectedCategory: DishCategory { get set }
    
    func setDish()
}
