//
//  TablesView.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import SwiftUI

struct TablesView: View {
    @Binding var coordinator: Coordinator
    @State var viewModel: TableListViewModel
    let layout: [GridItem] = [.init(), .init()]
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.tableSections, id: \.space) { section in
                    Section(section.space.label) {
                        LazyVGrid(columns: layout) {
                            ForEach(section.tablePosition) { table in
                                NavigationLink {
                                    TableDetailView(viewModel: .init(table: table),
                                                    tableVM: viewModel)
                                } label: {
                                    
                                    TableCell(viewModel: .init(table: table))
                                        .background(table.isTable ? Color.tableGreen : Color.tableBlue)
                                        .clipShape(.rect(cornerRadius: 20))
                                }
                            }
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
