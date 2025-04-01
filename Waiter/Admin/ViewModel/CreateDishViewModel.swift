//
//  CreateDishViewModel.swift
//  Waiter
//
//  Created by Влад Мади on 01.04.2025.
//

import Foundation

@Observable
class CreateDishViewModel {
    var title: String = ""
    var price: Int?
    var description = ""
    var volume = ""
    var category: Category = .salads
    
    func createDish() {
        
    }
}
