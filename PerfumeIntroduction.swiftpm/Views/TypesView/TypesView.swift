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
    @State var isEnough: Bool = false

    @State var isAnimation: Bool = false
    @State var isTest: Bool = false
    @State var offsetY: CGFloat = 0
    @State var opacity: Double = 0

    var body: some View {
        ZStack {
            VStack {
                Group {
                    Text("Classification according to the concentration")
                        .font(.system(.title, weight: .bold))
                        .padding(.bottom, 16)
                    Text("Typically categorized into Perfume Extrait(Perfume), Eau De Perfume(EDP), Eau De Toillete(EDT), Eau De Cologne(EDC)")
                        .font(.title2)
                    Text("✨Let's try it✨")
                        .font(.system(size: 20, weight: .semibold))
                        .padding(.top, 8)
                }

                    .foregroundStyle(.black)
                Spacer()
                mainAct()
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
        ) .onAppear {
            isAnimation = true
            isTest = true
        }
    }

    @ViewBuilder
    private func mainAct() -> some View {
        HStack {
            VStack(spacing: -30) {
                ZStack {
                    if value >= 30 {
                        Text("Enough!")
                            .bold()
                            .offset(y: offsetY)
                            .opacity(opacity)
                    }
                    spoidBtn()

                }
                Text("💧")
                    .font(.system(size: 60))
                    .offset(y: isDrop ? 100 : -10)
                    .opacity(isDrop ? 1 : 0)
                    .scaleEffect(isDrop ? 1 : 0.6)

                VStack {
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
                    Text("🚧 The percentage is a percentage of the total capacity.")
                        .font(.caption)
                        .foregroundStyle(.black)
                }
            }
            ZStack {
                ProgressView(value: Double(value), total: 30)
                    .progressViewStyle(RoundedRectProgressViewStyle())
                    .animation(.linear, value: value)
                // TODO: 퍼퓸 종류별 버튼 만들기 (value 값에 따른 enable/disable) 도 설정하기
                Text("<<")
                    .offset(x: 10)
            }
        }.frame(height: 420)
            .padding(.bottom, 8)
    }


    @ViewBuilder
    private func spoidBtn() -> some View {
        VStack {
            VStack {
                Text("Touch")
                Text("👇")
            }
                .foregroundStyle(.black)
                .font(.system(size: 16, weight: .bold))
                .offset(x: -100, y: isAnimation ? 0 : 10)
                .animation(.linear(duration: 1).repeatForever(autoreverses: true), value: isAnimation)
            Button {
                if value >= 30 {
                    withAnimation(.easeOut(duration: 1)) {
                        isEnough = true
                        offsetY = -10
                        opacity = 1
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            isEnough = false
                            offsetY = 0
                            opacity = 0
                        }
                    }
                }
                withAnimation(.easeOut(duration: 0.5)) {
                    if value < 30 {
                        isDrop = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
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
                .disabled(isDrop || isEnough ? true : false)
        }
    }
}

#Preview {
    TypesView()
}


