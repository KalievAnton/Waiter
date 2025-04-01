//
//  TableListView.swift
//  Waiter
//
//  Created by Влад Мади on 25.03.2025.
//

import SwiftUI

struct TableListView: View {
    var body: some View {
        Text("Столы")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Выйти", role: .destructive) {
                        
                    } .tint(.red)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "plus") {
                        //TODO: Добавить нового сотрудника
                    }
                }
            }
    }
}

#Preview {
    TableListView()
}
