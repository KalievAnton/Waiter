//
//  TableDetailView.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import SwiftUI

struct TableDetailView: View {
    @State var viewModel: TableDetailViewModel
    @Bindable var tableVM: TableListViewModel
    @State private var showAddDishView: Bool = false
    let layout: [GridItem] = [.init()]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: layout) {
                    ForEach(viewModel.table.order) { position in
                        DishCell(viewModel: .init(position: position))
                    }
                }
            }
            HStack {
                Text("ИТОГО:")
                    .tfBottomTotalTableStyle().padding(.leading, 16)
                Spacer()
                Text(viewModel.totalDishDescription)
                    .tfBottomTotalTableStyle().padding(.trailing, 16)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color.primary.ignoresSafeArea()
        }
        
        .onDisappear {
            guard let index = tableVM.tables.firstIndex (where: { table in
                viewModel.table.id == table.id
            }) else { return }
            tableVM.tables[index] = viewModel.table
        }
        
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    showAddDishView = true
                } label: {
                    Image("plusCircle")
                }
            }
        }
        
        .overlay {
            ZStack {
                Rectangle()
                    .fill(Color.black.opacity(0.8))
                    .ignoresSafeArea()
                
            }
            .foregroundStyle(.white)
            .frame(width: 370, height: 680, alignment: .leading)
            .background(Color.white)
            .clipShape(.rect(cornerRadius: 12))
            .padding(.vertical, 5)
            .offset(y: -20)
        }
        
    }
}

//#Preview {
//    TableDetailView(viewModel: .init(table: .init()), tableVM: .init(user: .init()))
//}
