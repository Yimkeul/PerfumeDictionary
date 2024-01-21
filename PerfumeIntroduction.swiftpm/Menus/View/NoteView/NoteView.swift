//
//  NoteView.swift
//
//
//  Created by yimkeul on 1/21/24.
//

import SwiftUI

struct NoteView: View {
    @State private var isAnimation: Bool = false
    @State private var isWind: Bool = false
    @State var isActive: Bool = false
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text("Note represents the changes or stages of fragrance over tiem")
                Text("""
                     Typically categorized into Top, Mid, and Base. Shall we explore the fragrance together by clicking on it?
                     """)
                Spacer()
                HStack {
                    ZStack {
                        VStack {
                            Text("Push me")
                            Text("👇")
                        }
                            .font(.system(size: 16, weight: .bold))
                            .offset(y: isAnimation ? -70 : -50)
                            .animation(
                                .linear(duration: 1)
                                .repeatForever(autoreverses: true)
                            , value: isAnimation
                        )

                        Button {
                            print("click")
                            isWind = true
                        } label: {
                            Image("Perfume")
                                .resizable()
                                .scaledToFit()
                                .scaleEffect(x: -1, y: 1)
                                .frame(width: 50)
                        }

                    }



                    Image("Wind")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                        .mask {
                        Rectangle()
                            .frame(width: isWind ? 50 : 0)
                            .offset(x: isWind ? 0 : -60)
                    }
                        .animation(.easeInOut(duration: 2).repeatForever(autoreverses: false), value: isWind)




                    Image("Person")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)

                    Button {
                        isActive = true
                    } label: {
                        Image("Exclamation")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                    }
                }
                Spacer()
            }
                .onAppear() {
                isAnimation = true
                isActive = false
            }
            if isActive {
                Dialog(isActive: $isActive)
            }
        }
    }
}

#Preview {
    NoteView()
}
