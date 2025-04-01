//
//  DishCellViewModel.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import Foundation

@Observable
class DishCellViewModel {
    var position: OrderPosition
    var priceDescription: String { "\(position.price) ₽" }
    var amountDescription: String { "\(position.count) шт" }
    var sumDishes: Int { position.count * position.price }
    var sumDescription: String { "\(sumDishes) ₽" }
    
    init(position: OrderPosition) {
        self.position = position
    }
}
