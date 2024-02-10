//
//  GenderView.swift
//
//
//  Created by yimkeul on 1/20/24.
//

import SwiftUI

enum genderType {
    case man
    case woman
}

struct GenderView: View {

    @State var genderType: genderType = .man
    @State var isActive: Bool = false
    @State var isAnimation: Bool = false

    var body: some View {
        ZStack {
            VStack {
                Group {
                    Text("Different perfume terms for each gender")
                        .font(.system(.title, weight: .bold))
                        .padding(.bottom, 16)
                    Text("Let's explore the fragrance terminology related to gender that is sometimes incorporated into the names of perfumes.")
                        .font(.title2)
                }

                Spacer()
                HStack {
                    Spacer()
                    genderBtn(.man)
                    Spacer()
                    genderBtn(.woman)
                    Spacer()
                }
                Spacer()
                Text("In recent years, gender-neutral perfumes have been widely introduced, so the terms mentioned above may not be used as commonly. Just keep that in mind.")
                Spacer()
            }.foregroundStyle(.black)
            .padding()
            if isActive {
                GenderDialog(genderType: $genderType, isActive: $isActive)
            }
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
            isActive = false
            withAnimation(.linear(duration: 1).repeatForever(autoreverses: true)) {
                isAnimation = true
            }
        }
    }

    @ViewBuilder
    private func genderBtn(_ gender: genderType) -> some View {
        VStack {
            VStack {
                Text("Touch")
                Text("👇")
            }
                .foregroundStyle(.black)
                .font(.system(size: 16, weight: .bold))
                .offset(x: -20, y: isAnimation ? 0 : 10)

            Button {
                genderType = gender
                isActive = true
            } label: {
                Text(gender == .man ? "💁‍♂️" : "💁‍♀️")
                    .font(.system(size: 150, weight: .bold))
            }
        }
    }
}

#Preview {
    GenderView()
}
