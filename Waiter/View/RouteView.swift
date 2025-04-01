//
//  ContentView.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import SwiftUI

struct RouteView: View {
    @State var coordinator = Coordinator()
    
    var body: some View {
        switch coordinator.appState {
        case .unauthorized:
            AuthView(coordinator: $coordinator)
        case .authorized(let userID):
            NavigationStack {
                TableView(coordinator: $coordinator,
                          viewModel: .init(userID: userID))
                    .navigationTitle("Столы")
            }
        case .adminpanel:
                TabView {
                    NavigationStack { EmployeeListView(coordinator: $coordinator) }
                    .tabItem { Label("Сотрудники", systemImage: "person.2.circle.fill") }
                    NavigationStack { TableListView() }
                    .tabItem { Label("Столы", systemImage: "table.furniture") }
                    NavigationStack { ProductListView() }
                        .tabItem { Label("Меню", systemImage: "menucard") }
                    NavigationStack { Text("Статистика") }
                        .tabItem { Label("Статистика", systemImage: "chart.xyaxis.line") }
                }
        }
    }
}

enum AppState {
    case authorized(userID: String)
    case unauthorized
    case adminpanel
}

#Preview {
    RouteView()
}
