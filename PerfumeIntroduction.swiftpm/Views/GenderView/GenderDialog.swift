//
//  GenderDialog.swift
//
//
//  Created by yimkeul on 1/24/24.
//

import SwiftUI

struct GenderDialog: View {
    @Binding var genderType: genderType
    @Binding var isActive: Bool

    @State private var offset: CGFloat = 1000
    @State private var isAnimation: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            HStack {
                Spacer()
                card(genderType == .man ? "Man" : "Woman", delay: 0)
                Spacer()
                card(genderType == .man ? "Homme" : "Femme", delay: 1)
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                card(genderType == .man ? "Uomo" : "Elle", delay: 2)
                Spacer()
                card(genderType == .man ? "Him" : "Her", delay: 3)
                Spacer()
                card(genderType == .man ? "Male" : "Donna", delay: 4)
                Spacer()
            }
            Spacer()
            HStack {
                Text(genderType == .man ? "💁‍♂️" : "💁‍♀️")
                    .font(.system(size: 200, weight: .bold))
                    .padding(.horizontal, 40)
                Text(genderType == .man ? "The terms used for perfume with a strong masculine scent are as follows" : "The terms used for perfumes with a strong feminine scent are as follows")
                    .font(.title)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.leading)

                Spacer()
            }.padding(.trailing, 40)
            Spacer()
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .toolbar(content: {
            Button {
                close()
            } label: {
                Image(systemName: "chevron.down")
                    .font(.system(size: 24))
                    .foregroundColor(Color.accentColor)
            }
        })
            .background(
            LinearGradient(gradient: Gradient(colors: [.black, .gray]),
                           startPoint: .bottom,
                           endPoint: .top)
                .ignoresSafeArea()
        )
            .offset(y: offset)
            .onAppear() {
            withAnimation(.easeIn) {
                offset = 0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                isAnimation = true
            }
        }
    }

    private func close() {
        withAnimation(.easeOut) {
            offset = 1000
            isActive = false
        }
    }

    @ViewBuilder
    private func card(_ text: String, delay: Int) -> some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(width: 230, height: 130)
                .clipShape(RoundedRectangle(cornerRadius: 12.0, style: .continuous))
                .shadow(radius: 5, x: 0, y: 10)
            Text(text)
                .font(.system(size: 50, weight: .semibold))
        }
            .offset(y: isAnimation ? 0 : 30)
            .opacity(isAnimation ? 1 : 0)
            .animation(.easeInOut(duration: 1).delay(TimeInterval(delay)), value: isAnimation)
    }
}

