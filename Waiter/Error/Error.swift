//
//  Error.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import Foundation

enum MyError: LocalizedError {
    case invalidRole
    case invalidName
    case invalidNumber
    case emptyField
    case invalidDocumentSnapshot
    case invalidDataInSnapshot
    
    var localizedDescription: String? {
        switch self {
        case .invalidRole: "Ошибка профиля!"
        case .invalidName: "Ошибка имени!"
        case .invalidNumber: "Ошибка номера!"
        case .emptyField: "Пустое поле!"
        case .invalidDocumentSnapshot: "Ошибка пользователя!"
        case .invalidDataInSnapshot: "Ошибка даты"
        }
    }
    
    var failureReason: String? {
        switch self {
        case .invalidRole: "Выберите профиль, и нажмите Далее"
        case .invalidName: "Неправильно введено имя профиля"
        case .invalidNumber: "Неправильно введен номер телефона"
        case .emptyField: "Поле ввода не должно быть пустым! Введите данные"
        case .invalidDocumentSnapshot: "Такой пользователь не найден"
        case .invalidDataInSnapshot: "Неправильная дата"
        }
    }
}
