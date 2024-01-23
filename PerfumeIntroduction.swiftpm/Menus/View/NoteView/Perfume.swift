//
//  SwiftUIView.swift
//
//
//  Created by yimkeul on 1/24/24.
//

import SwiftUI

struct Perfume: View {
    @Binding var isAnimation: Bool
    @Binding var isWind: Bool
    
    let miniW = UIScreen.main.bounds.width
    let miniH = UIScreen.main.bounds.height
    private let soundManager = SoundManager.instance
    
    private func MiniPefume () -> some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(Color.black)
                .frame(width: 25, height: 15)
            Rectangle()
                .fill(Color.black)
                .frame(width: 50, height: 25)

            ZStack() {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 130, height: 230)
                    .clipShape(RoundedRectangle(cornerRadius: 12.0, style: .continuous))
                    .shadow(radius: 5 , x: 0, y: 10)
                Rectangle()
                    .stroke(Color.black, lineWidth: 6)
                    .frame(width: 100, height: 200)

                Rectangle()
                    .stroke(Color.black, lineWidth: 3)
                    .frame(width: 80, height: 180)
            }
        }
    }
    private func MiniView() -> some View {
        HStack {
            ZStack {
                VStack {
                    Text("Push me")
                    Text("👇")
                }
                    .font(.system(size: 16, weight: .bold))
                    .offset(y: isAnimation ? (-150) - 35 : (-150) - 25)
                    .animation(
                        .linear(duration: 1)
                        .repeatForever(autoreverses: true)
                    , value: isAnimation
                )
                MiniPefume()
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 2)) {
                            isWind = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                soundManager.playSound(sound: .perfume)
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                isWind = false
                            }
                        }
                    }
            }.disabled(isWind ? true: false)
            
            Image("Wind")
                .resizable()
                .frame(width: CWidth / 2, height : 80)
                .scaledToFit()
                .mask {
                Rectangle()
                    .frame(width: CWidth, height: CWidth)
                    .offset(x: isWind ? CWidth : -CWidth)
                }.offset(x: -50, y : -135)
        }
    }
    
    private func Perfume() -> some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(Color.black)
                .frame(width: 50, height: 30)
            Rectangle()
                .fill(Color.black)
                .frame(width: 100, height: 50)

            ZStack() {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 260, height: 460)
                    .clipShape(RoundedRectangle(cornerRadius: 24.0, style: .continuous))
                    .shadow(radius: 5 , x: 0, y: 10)
                Rectangle()
                    .stroke(Color.black, lineWidth: 8)
                    .frame(width: 200, height: 400)

                Rectangle()
                    .stroke(Color.black, lineWidth: 4)
                    .frame(width: 160, height: 360)
            }
        }
        
    }
    private func View() -> some View {
        HStack {
            ZStack {
                VStack {
                    Text("Push me")
                    Text("👇")
                }
                    .font(.system(size: 16, weight: .bold))
                    .offset(y: isAnimation ? (-250) - 70 : (-250) - 50)
                    .animation(
                        .linear(duration: 1)
                        .repeatForever(autoreverses: true)
                    , value: isAnimation
                )
                Perfume()
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 1)) {
                            isWind = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                isWind = false
                            }
                        }
                    }
            }.disabled(isWind ? true: false)
            
            Image("Wind")
                .resizable()
                .frame(width: CWidth, height : 100)
                .scaledToFit()
                .mask {
                Rectangle()
                    .frame(width: CWidth, height: CWidth)
                    .offset(x: isWind ? CWidth : -CWidth)
                }.offset(x: -100, y : -265)
        }
    }
    
    var body: some View {
        MiniView()
    }

}


#Preview {
    Perfume(isAnimation: .constant(false), isWind: .constant(false))
}
