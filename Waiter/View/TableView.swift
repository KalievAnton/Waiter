//
//  TableView.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import SwiftUI

struct TableView: View {
    @Binding var coordinator: Coordinator
    @State var viewModel: TableViewModel
    let layout: [GridItem] = [.init(), .init()]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: layout) {
                    ForEach(viewModel.tables) { table in
                        NavigationLink {
                            TableDetailView(viewModel: .init(table: table), tableVM: viewModel)
                        } label: {
                            TableCell(viewModel: .init(table: table))
                                .background(table.isTable ? Color.tableGreen : Color.tableBlue)
                                .clipShape(.rect(cornerRadius: 20))
                        }
                    }
                }
            }
            
            HStack {
                Text("ИТОГО:")
                    .tfBottomTotalTableStyle().padding(.leading, 16)
                Spacer()
                Text("Итоговая сумма")
                    .tfBottomTotalTableStyle().padding(.trailing, 16)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color.primary.ignoresSafeArea()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Выйти") {
                    Task {
                        await AuthService.signOut()
                    }
                }
            }
        }
    }
}

//#Preview {
//    TableView(coordinator: .constant(.init()), viewModel: .init(user: .init()))
//}
