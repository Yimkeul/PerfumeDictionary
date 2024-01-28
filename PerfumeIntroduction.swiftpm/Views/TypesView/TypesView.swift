//
//  TypesView.swift
//
//
//  Created by yimkeul on 1/21/24.
//

import SwiftUI

struct TypesView: View {

    @State var isW: CGFloat = UIScreen.main.bounds.width
    @State var isH: CGFloat = UIScreen.main.bounds.height
    @State var isS: CGFloat = 0
    @State var value: Int = 0

    @State var isDrop: Bool = false


    var body: some View {

        ZStack {
            VStack {
                Spacer()
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
//                Spacer()
                VStack(spacing: 0) {
                    ZStack {
                        Color.blue
                        Button {
                            value += 1
                            withAnimation(.easeInOut(duration: 1)) {
                                isDrop = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    isDrop = false
                                }
                            }
                        } label: {
                            Image("SpoidAndHand")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .scaledToFit()
                        }
                            .offset(x: -60)
                            .disabled(isDrop ? true : false)
                    
                        Text("💧")
                            .font(.system(size: 60))
                            .offset(y: isDrop ? 200 : 180)
                            .opacity(isDrop ? 1 : 0)
                            .scaleEffect(isDrop ? 1.2 : 0.8)
                    }
                    
                    
                    ZStack {
                        Color.pink
                        Image("Beaker")
                            .resizable()
                            .frame(width: 250, height: 250)
                            .scaledToFit()
                        Text("\(value)%")
                            .foregroundStyle(.green)
                            .font(.system(size: 30, weight: .bold))
                            .offset(y: 100)
                    }
                }
                .frame(height: 270)
                .padding(.top, 100)
                .background(.green)
                Spacer()
            }
                .padding()
                .frame(width: isS)
        }
            .onAppear() {
            isS = min(isW, isH)
            print(isS)
        }
            .onChange(of: UIScreen.main.bounds.size) { _ in
            isW = UIScreen.main.bounds.width
            isH = UIScreen.main.bounds.height
            isS = min(isW, isH)
            print(isS)
        }
    }
}

#Preview {
    TypesView()
}


