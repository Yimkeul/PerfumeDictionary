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
    @Binding var isFeel: Bool
    @Binding var isSmell: Bool
    
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
                    .stroke(Color.black, lineWidth: 3)
                    .frame(width: 100, height: 200)

                Rectangle()
                    .stroke(Color.black, lineWidth: 2)
                    .frame(width: 80, height: 180)
            }
        }
    }
    private func MiniView() -> some View {
        HStack {
            ZStack {
                VStack {
                    Text("Push")
                    Text("👇")
                }
                    .font(.system(size: 16, weight: .bold))
                    .offset(y: isAnimation ? (-150) - 35 : (-150) - 25)
                MiniPefume()
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 2)) {
                            isWind = true
                            soundManager.playSound(sound: .perfume)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                isWind = false
                                isSmell = true
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                    isFeel = true
                                }
                            }
                        }
                    }
            }.disabled(isWind ? true: false)
            
            Image("Wind2")
                .resizable()
                .frame(width: 300, height : 80)
                .scaledToFit()
                .font(.system(size: 300))
                .mask {
                Rectangle()
                    .frame(width: 300, height: 300)
                    .offset(x: isWind ? 300 : -300)
                }.offset(x: -50, y : -135)
        }
    }
    

    
    var body: some View {
        MiniView()
    }

}


#Preview {
    Perfume(isAnimation: .constant(false), isWind: .constant(false), isFeel: .constant(false), isSmell: .constant(false))
}
