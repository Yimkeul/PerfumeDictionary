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
    @State private var isDisable: Bool = false

    var body: some View {
        ZStack {
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
                Spacer()
                Button {
                    isOnboard.toggle()
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
                    .disabled(isDisable)
                Spacer()
            }
                .foregroundStyle(.black)

        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarTitleDisplayMode(.inline)
            .background(
            Image("BGImg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
    }
}


