//
//  Error.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import Foundation

enum MyError: LocalizedError {
    case invalidNumber
    case invalidPin
    case emptyField
    
    var localizedDescription: String? {
        switch self {
        case .invalidNumber: "Ошибка номера!"
        case .invalidPin: "Ошибка пин-кода!"
        case .emptyField: "Пустое поле!"
        }
    }
    
    var failureReason: String? {
        switch self {
        case .invalidNumber: "Неправильно введен номер сотрудника"
        case .invalidPin: "Неправильно введен пин-код"
        case .emptyField: "Поле ввода не должно быть пустым! Введите данные"
        }
    }
}
