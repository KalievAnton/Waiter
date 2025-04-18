//
//  RouteAdminView.swift
//  Waiter
//
//  Created by Влад Мади on 08.04.2025.
//

import SwiftUI

struct RouteAdminView: View {
    @Binding var coordinator: Coordinator
   
    var body: some View {
        TabView {
            NavigationStack { EmployeeListView(coordinator: $coordinator) }
                .tabItem { Label("Сотрудники", systemImage: "person.2.circle.fill") }
            NavigationStack { TableListView(coordinator: $coordinator) }
                .tabItem { Label("Столы", systemImage: "table.furniture") }
            NavigationStack { ProductListView() }
                .tabItem { Label("Меню", systemImage: "menucard") }
            NavigationStack { Text("Статистика") }
                .tabItem { Label("Статистика", systemImage: "chart.xyaxis.line") }
        }
    }
}
