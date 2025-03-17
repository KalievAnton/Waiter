//
//  CustomDropdown.swift
//  Waiter
//
//  Created by Anton Kaliev on 13.03.2025.
//

import SwiftUI

struct CustomDropdown: View {
    @State var show = false
    @State var title = "Выберите тип профиля"
    
    var body: some View {
        VStack {
            ZStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
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
                                        title = role.rawValue
                                        show.toggle()
                                    }
                                } label: {
                                    Text(role.rawValue).foregroundStyle(.black)
                                        .font(Font.custom(.mediumMontserrat, size: 16))
                                    Spacer()
                                }
                            }
                            .padding(.horizontal)
                        }
                        .padding(.vertical, 15)
                    }
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1)
                }
                .frame(height: show ? 150 : 50)
                .offset(y: show ? 0 : -105)
                .foregroundStyle(.white)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 50)
                        .foregroundStyle(.white)
                    HStack {
                        Text(title)
                            .foregroundStyle(.black)
                        Spacer()
                        
                        Image(systemName: "arrowtriangle.left.fill")
                            .rotationEffect(.degrees(show ? 90 : 0))
                    }
                    .font(Font.custom(.mediumMontserrat, size: 16))
                    .padding(.horizontal)
                    .foregroundStyle(.black)
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1)
                        .foregroundStyle(.white)
                        .frame(height: 50)
                }
                .offset(y: -105)
                .onTapGesture {
                    withAnimation {
                        show.toggle()
                    }
                }
            }
        }
        .offset(y: 110)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CustomDropdown()
    }
}
