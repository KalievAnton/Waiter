//
//  CustomDropdown.swift
//  Waiter
//
//  Created by Anton Kaliev on 13.03.2025.
//

import SwiftUI

struct CustomDropdown: View {
    @State var show = false
    @Binding var role: Role?
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text(role?.label ?? "Выберите тип профиля")
                    .foregroundStyle(.white)
                Spacer()
                Image(systemName: "arrowtriangle.left.fill")
                    .foregroundStyle(.green)
                    .rotationEffect(.degrees(show ? -90 : 0))
            }
            .font(Font.custom(.boldMontserrat, size: 16))
            .padding(.horizontal)
            .foregroundStyle(.black)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 49)
                    .foregroundStyle(.clear)
            }
            .onTapGesture {
                show.toggle()
            }
            if show {
                    VStack(spacing: 10) {
                        ForEach(Role.allCases, id: \.self) { role in

                            Button {
                                withAnimation {
                                    self.role = role
                                    show.toggle()
                                }
                            } label: {
                                Text(role.label).foregroundStyle(.white)
                                    .font(Font.custom(.mediumMontserrat, size: 16))
                                Spacer()
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical, 15)
                .frame(height: show ? 130 : 49)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.clear)
                        .stroke(Color.white, lineWidth: 1)
                }
                .onTapGesture {
                    withAnimation {
                        show.toggle()
                    }
                }
            }
        }
        .animation(.easeInOut, value: show)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CustomDropdown(role: .constant(.admin))
    }
}
