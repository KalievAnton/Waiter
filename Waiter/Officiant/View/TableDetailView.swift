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
                    showAddDishView.toggle()
                    
                } label: {
                    Image("plusCircle")
                }
            }
        }
        
        .overlay {
            VStack {
                Text("Блюда")
                    .font(.custom(.boldMontserrat, size: 15))
                    .foregroundStyle(.white)
                    .padding()
                ScrollView {
                    VStack {
                        ForEach(viewModel.productsVM.sections, id: \.categoryID) { section in
                            Section(viewModel.productsVM.getCategoryTitleBy(categoryID: section.categoryID) ?? "----") {
                                ForEach(section.dishes) { dish in
                                    HStack {
                                        Text(dish.title).bold()
                                        Spacer()
                                        Text(dish.volume)
                                            .padding(8)
                                        Text("\(dish.price) ₽")
                                    }
                                    .padding(8)
                                    .background(.white.opacity(0.3))
                                    .clipShape(.rect(cornerRadius: 8))
                                    .padding(4)
                                    .onTapGesture {
                                        viewModel.addPosition(dish: dish)
                                        showAddDishView = false
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white.opacity(0.5))
            }
            .offset(y: showAddDishView ? -20 : 1000)
            .padding(.vertical, 36)
            .padding(.horizontal, 12)
        }
    }
}


#Preview {
    TableDetailView(viewModel: .init(table: .init()), tableVM: .init())
}
