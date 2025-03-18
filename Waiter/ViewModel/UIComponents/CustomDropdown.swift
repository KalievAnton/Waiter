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
                    .foregroundStyle(.black)
                Spacer()
                
                Image(systemName: "arrowtriangle.left.fill")
                    .rotationEffect(.degrees(show ? 90 : 0))
            }
            .font(Font.custom(.mediumMontserrat, size: 16))
            .padding(.horizontal)
            .foregroundStyle(.black)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 50)
                    .foregroundStyle(.white)
            }
            .onTapGesture {
                show.toggle()
            }
            if show {
                ScrollView {
                    VStack(spacing: 18) {
                        ForEach(Role.allCases, id: \.self) { role in
                            if role != Role.allCases.first {
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundStyle(.black)
                            }
                            Button {
                                withAnimation {
                                    self.role = role
                                    show.toggle()
                                }
                            } label: {
                                Text(role.label).foregroundStyle(.black)
                                    .font(Font.custom(.mediumMontserrat, size: 16))
                                Spacer()
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical, 15)
                }
                .frame(height: show ? 230 : 50)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1)
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
