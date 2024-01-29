//
//  TopNoteView.swift
//
//
//  Created by yimkeul on 1/27/24.
//

import SwiftUI

struct TopNoteView: View {

    @Binding var isActive: Bool
    var isType: noteType

    @State var isFeel: Bool = false
    @State var isWind: Bool = false
    @State var isSmell: Bool = false
    @State var isAnimation: Bool = false

    @State var isFeelScent: Bool = false

    private let soundManager = SoundManager.instance

    var body: some View {
        HStack {
            Spacer()
            HStack {
                VStack {
                    VStack {
                        Text("Push")
                        Text("👇")
                    }
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .bold))
                        .offset(y: isAnimation ? 0 : 10)
                    MiniPefume()
                        .onTapGesture {
                        withAnimation(.easeInOut(duration: 2)) {
                            isWind = true
                            soundManager.playSound(sound: .perfume)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                isWind = false
                                isFeelScent = true
                                withAnimation(.easeInOut(duration: 1).speed(0.5)
                                    .repeatForever(autoreverses: false)) {
                                    isSmell = true
                                }
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                    isFeel = true
                                }
                            }
                        }
                    }
                }.disabled(isWind ? true : false)
                Image("Wind")
                    .resizable()
                    .frame(width: 300, height: 80)
                    .scaledToFit()
                    .font(.system(size: 300))
                    .mask {
                    Rectangle()
                        .frame(width: 300, height: 300)
                        .offset(x: isWind ? 300 : -300)
                }.offset(x: -50, y: -135)
            }
            Spacer()
            Feel(isFeel: isFeel)
            Spacer()
        }
            .onAppear() {
            withAnimation(.linear(duration: 1)
                .repeatForever(autoreverses: true)) {
                isAnimation = true
            }
            isActive = false
        }
    }

    @ViewBuilder
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
                    .shadow(radius: 5, x: 0, y: 10)
                Rectangle()
                    .stroke(Color.black, lineWidth: 3)
                    .frame(width: 100, height: 200)

                Rectangle()
                    .stroke(Color.black, lineWidth: 2)
                    .frame(width: 80, height: 180)
            }
        }
    }

    @ViewBuilder
    private func Feel(isFeel: Bool) -> some View {
        ZStack {
            if isFeelScent {
                Text("🍊")
                    .offset(x: -80, y: isSmell ? -50 : 0)
                    .opacity(isSmell ? 0 : 0.8)
                Text("🍋")
                    .offset(x: -100, y: isSmell ? -110 : 0)
                    .opacity(isSmell ? 0 : 0.8)
                Text("🍊")
                    .offset(x: 80, y: isSmell ? -120 : 0)
                    .opacity(isSmell ? 0 : 0.8)
                Text("🍋")
                    .offset(x: 100, y: isSmell ? -80 : 0)
                    .opacity(isSmell ? 0 : 0.8)
            }


            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)

            Image(systemName: "exclamationmark.bubble")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .foregroundColor(.yellow)
                .offset(x: 50, y: isAnimation ? -80 : -90)
                .opacity(isFeel ? 1 : 0)
                .scaleEffect(isFeel ? 1.5 : 0)
                .onTapGesture {
                isActive = true
            }
        }
    }
}

