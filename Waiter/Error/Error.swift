//
//  Error.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import Foundation

enum MyError: LocalizedError {
    case invalidRole
    case invalidPost
    case invalidPassword
    case emptyField
    case invalidDocumentSnapshot
    case invalidDataInSnapshot
    
    var localizedDescription: String? {
        switch self {
        case .invalidRole: "Ошибка профиля!"
        case .invalidPost: "Ошибка почты!"
        case .invalidPassword: "Ошибка пароля!"
        case .emptyField: "Пустое поле!"
        case .invalidDocumentSnapshot: "Ошибка пользователя!"
        case .invalidDataInSnapshot: "Ошибка даты"
        }
    }
    
    var failureReason: String? {
        switch self {
        case .invalidRole: "Выберите профиль, и нажмите Далее"
        case .invalidPost: "Неправильно введена почта"
        case .invalidPassword: "Неправильно введен пароль"
        case .emptyField: "Поле ввода не должно быть пустым! Введите данные"
        case .invalidDocumentSnapshot: "Такой пользователь не найден"
        case .invalidDataInSnapshot: "Неправильная дата"
        }
    }
}
