//
//  OnboardingView.swift
//  PerfumeIntroduction
//
//  Created by yimkeul on 1/13/24.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var isOnboard: Bool
    @State private var isAnimation: Bool = false
    @State private var isAppear: Bool = false
    @State private var onboardEffect = OnboardEffect()

    var body: some View {
        ZStack {
            Image("BookCover")
                .resizable()
                .scaledToFill()
                .opacity(0.5)
                .ignoresSafeArea(.container, edges: .bottom)

            VStack {
                Spacer()
                Text("Perfume Introduction")
                    .font(.system(size: 50, weight: .bold))

                Spacer()
                Image("Intro")
                    .imageScale(.large)
                Spacer()
                Text("Perfume has a term for each characteristic")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundStyle(.white)
                Spacer()
                Button {
                    isAppear.toggle()
                } label: {
                    ZStack {
                        Capsule()
                            .fill(Color.white)
                            .frame(width: 300, height: 50)
                            .shadow(radius: 5, y: 10)
                        Text("Let's See!")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundStyle(.black)
                    }
                }
                    .padding(.horizontal, 8)
                Spacer()
            }

            if isAppear == true {
                onboardingEffect(isAnimation: isAnimation, item1: onboardEffect.items1, item2: onboardEffect.items2)
            }
        }
            .onAppear() {
            onboardEffect.setItem()
        }
    }

    @ViewBuilder
    private func onboardingEffect(isAnimation: Bool, item1: [BGEffectData], item2: [BGEffectData]) -> some View {
        ZStack {
            ForEach(item1, id: \.self) {
                item in
                Image(item.imageName)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .rotationEffect(isAnimation ? item.rotate : .degrees(0))
                    .offset(x: item.xPos, y: isAnimation ? item.yPos : -onboardEffect.pos)
                    .animation(
                    Animation.timingCurve(item.p1, 0, item.p3, 0).speed(0.2)
                    , value: isAnimation)
            }

            ForEach(item2, id: \.self) {
                item in
                Image(item.imageName)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .rotationEffect(isAnimation ? item.rotate : .degrees(0))
                    .offset(x: item.xPos, y: isAnimation ? item.yPos : -onboardEffect.pos)
                    .animation(
                    Animation.timingCurve(item.p1, 0, item.p3, 0).speed(0.2)
                        .delay(0.5)
                    , value: isAnimation)
            }
        }
            .onAppear() {
            self.isAnimation = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.8, execute: {
                self.isOnboard.toggle()
            })
        }
            .onDisappear() {
            self.isAnimation = false
        }
    }
}


