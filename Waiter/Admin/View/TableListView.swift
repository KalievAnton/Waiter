//
//  TableListView.swift
//  Waiter
//
//  Created by Влад Мади on 25.03.2025.
//

import SwiftUI

struct TableListView: View {
    @State private var viewModel = TableListViewModel()
    @State private var newNumber: Int?
    @State private var showAddTableAlert = false
    
    var body: some View {
        List(viewModel.tableSections, id: \.space.label) { section in
            Section(section.space.label) {
                ForEach(section.tablePosition) { table in
                    Text("Стол #\(table.number)")
                        .swipeActions {
                            Button(role: .destructive) {
                                viewModel.deleteTable(table: table)
                            } label: {
                                Label("Удалить", systemImage: "trash.fill")
                            }
                        }
                }
            }
        }
        .refreshable {
            viewModel.fetchAllTables()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Выйти", role: .destructive) {
                    
                } .tint(.red)
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("", systemImage: "plus.circle") {
                    showAddTableAlert.toggle()
                }
            }
        }
        .overlay {
            VStack {
                Picker("Выберите зону обслуживания",
                       selection: $viewModel.space) {
                    ForEach(Space.allCases) { space in
                        Text(space.label).tag(space)
                    }
                }.tint(.black)
                Text("Создать стол").bold()
                TextField("Номер стола",
                          value: $newNumber,
                          format: .number)
                RoundedButton(text: "Готово!") {
                    if let newNumber {
                        viewModel.createTable(number: newNumber)
                        showAddTableAlert = false
                        self.newNumber = nil
                    }
                }
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .shadow(radius: 3)
            }
            .padding()
            .offset(y: showAddTableAlert ? 0 : 1000)
        }
    }
}

#Preview {
    TableListView()
}
