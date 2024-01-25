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

    @State var isW: CGFloat = UIScreen.main.bounds.width
    @State var isH: CGFloat = UIScreen.main.bounds.height
    @State var isS: CGFloat = 0

    var body: some View {
        ZStack {
            VStack {
                Group {
                    Text("Different perfume terms for each gender")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 16)
                    Text("Let's explore the fragrance terminology related to gender that is sometimes incorporated into the names of perfumes.")
                        .font(.title2)
                }.foregroundColor(.black)

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
            }
                .padding()
                .frame(width: isS)
            if isActive {
                GenderDialog(genderType: $genderType, isActive: $isActive, isS: $isS)
            }
        }
            .onAppear() {
            isActive = false
                withAnimation(.linear(duration: 1).repeatForever(autoreverses: true)) {
                isAnimation = true
            }
            isS = min(isW, isH)
        }
            .onChange(of: UIScreen.main.bounds.size) { _ in
            isW = UIScreen.main.bounds.width
            isH = UIScreen.main.bounds.height
            isS = min(isW, isH)
        }

    }
    
    @ViewBuilder
    private func genderBtn(_ gender: genderType) -> some View {
        VStack {
            HStack(spacing: 0) {
                Text("Click")
                    .foregroundStyle(.black)
                Text("👇")
            }.offset(y: isAnimation ? 0 : 10)
                .font(.system(size: 16, weight: .bold))
                .offset(x: -10)
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
