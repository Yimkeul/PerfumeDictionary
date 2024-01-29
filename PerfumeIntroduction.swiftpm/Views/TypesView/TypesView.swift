//
//  TypesView.swift
//
//
//  Created by yimkeul on 1/21/24.
//

import SwiftUI

struct TypesView: View {
    @State var value: Int = 0
    @State var isDrop: Bool = false
    var body: some View {

        ZStack {
            VStack {
                Group {
                    Text("Classification according to the concentration")
                        .font(.system(.title, weight: .bold))
                        .padding(.bottom, 16)
                    Text("Typically categorized into Perfume Extrait(Perfume), Eau De Perfume(EDP), Eau De Toillete(EDT), Eau De Cologne(EDC)")
                        .font(.title2)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                    Text("✨Let's make it✨")
                        .font(.system(size: 20, weight: .semibold))
                        .padding(.top, 8)
                }
                    .foregroundStyle(.black)
                Spacer()
                VStack(spacing: -30) {
                    Button {
                        
                        withAnimation(.easeOut(duration: 1)) {
                            if value < 30 {
                                isDrop = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    isDrop = false
                                    value += 1
                                }
                            }
                        }
                        
                    } label: {
                        Image("SpoidAndHand")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .scaledToFit()
                    }
                        .offset(x: -100)
                        .disabled(isDrop ? true : false)
                    
                    
                    Text("💧")
                        .font(.system(size: 60))
                            .offset(y: isDrop ? 100 : -20)
                            .opacity(isDrop ? 1 : 0)
                            .scaleEffect(isDrop ? 1 : 0.6)



                    ZStack {
                        Image("Beaker")
                            .resizable()
                            .frame(width: 250, height: 250)
                            .scaledToFit()
                        Text("\(value)%")
                            .foregroundStyle(.green)
                            .font(.system(size: 30, weight: .bold))
                            .offset(y: 95)
                    }
                }.frame(height: 300)
                Spacer()
            }
                .padding()

        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarTitleDisplayMode(.inline)
            .background(
            Image("BGImg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
            .onAppear() {
        }
    }
}

#Preview {
    TypesView()
}


