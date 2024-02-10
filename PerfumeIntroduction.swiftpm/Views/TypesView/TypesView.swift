//
//  TypesView.swift
//
//
//  Created by yimkeul on 1/21/24.
//

import SwiftUI

enum perfumeType {
    case edc
    case edt
    case edp
    case ep
}

struct TypesView: View {
    @State var value: Int = 0
    @State var isDrop: Bool = false
    @State var isEnough: Bool = false

    @State var isAnimation: Bool = false
    @State var isActive: Bool = false
    @State var offsetY: CGFloat = 0
    @State var opacity: Double = 0

    
    @State var isDisables: [Bool] = [true,true,true,true]
    @State var isType: perfumeType = .edc
    
    private let soundManager = SoundManager.instance

    var body: some View {
        ZStack {
            VStack {
                Group {
                    Text("Classification according to the concentration")
                        .font(.system(.title, weight: .bold))
                        .padding(.bottom, 16)
                    Text("Typically categorized into Extrait Perfume(EP, Perfume), Eau De Perfume(EDP), Eau De Toillete(EDT), Eau De Cologne(EDC)")
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
            if isActive {
                TypesDialog(isActive: $isActive, isType: isType)
            }
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
            isActive =  false
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
                VStack {
                    VStack {
                        Text("Check Enable Tag")
                        Text("👇")
                    }
                        .foregroundStyle(.black)
                        .font(.system(size: 16, weight: .bold))
                        .offset(x: 50, y: isAnimation ? -60 : -50)
                        .animation(.linear(duration: 1).repeatForever(autoreverses: true), value: isAnimation)
                    ProgressView(value: Double(value), total: 30)
                        .progressViewStyle(RoundedRectProgressViewStyle(value: $value))
                        .animation(.linear, value: value)
                }
                VStack(spacing: 0) {
                    Spacer()
                    cLabel("EP", isDisable: isDisables[3], perfumeType: .ep)
                        .offset(x: 70, y: -130)
                    cLabel("EDP", isDisable: isDisables[2], perfumeType: .edp)
                        .offset(x: 70, y: -60)
                    cLabel("EDT", isDisable: isDisables[1], perfumeType: .edt)
                        .offset(x: 70, y: -40)
                    cLabel("EDC", isDisable: isDisables[0], perfumeType: .edc)
                        .offset(x: 70, y: -30)
                }
            }
        }
            .frame(height: 420)
            .padding(.bottom, 8)
    }


    @ViewBuilder
    private func cLabel(_ title: String, isDisable: Bool, perfumeType: perfumeType) -> some View {
        Button {
            isActive = true
            isType = perfumeType
        } label: {
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
                    Text("🏷️")
                    Text(title)
                        .foregroundStyle(isDisable ? Color.Disable : .black)
                        .bold()
                    Spacer()
                }.frame(width: 80)
            }
        }.disabled(isDisable)
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
                        soundManager.playSound(sound: .drop)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            
                            isDrop = false
                            if value >= 15 {
                                value += 5
                            } else {
                                value += 1
                            }
                            if value == 3 {
                                isDisables[0] = false
                                isActive = true
                                isType = .edc
                            }
                            if value == 5 {
                                isDisables[1] = false
                                isActive = true
                                isType = .edt
                            }
                            if value == 8 {
                                isDisables[2] = false
                                isActive = true
                                isType = .edp
                            }
                            if value == 15 {
                                isDisables[3] = false
                                isActive = true
                                isType = .ep
                            }
                            
                            
                            
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


