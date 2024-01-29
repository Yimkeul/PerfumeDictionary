//
//  SwiftUIView.swift
//
//
//  Created by yimkeul on 1/27/24.
//

import SwiftUI

struct MidNoteView: View {

    @Binding var isActive: Bool
    var isType: noteType

    @State var isFeel: Bool = false
    @State var isSmell: Bool = false

    var body: some View {
        VStack(spacing: 0) {
            Feel(isFeel: isFeel)
            Person()
        }
            .onAppear() {
            withAnimation(.easeInOut(duration: 1).speed(0.5)
                .repeatForever(autoreverses: false)) {
                    isSmell = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                    isFeel = true
                }
            }


            isActive = false
        }
    }


    @ViewBuilder
    private func Feel(isFeel: Bool) -> some View {
        ZStack {
            Image(systemName: "person.3.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)

            Image(systemName: "exclamationmark.bubble")
                .resizable()
                .scaledToFit()
                .frame(width: 40)
                .foregroundColor(.yellow)
                .offset(x: 10, y: -55)
                .opacity(isFeel ? 1 : 0)
                .scaleEffect(isFeel ? 1.5 : 0)
                .onTapGesture {
                isActive = true
            }
        }
    }

    @ViewBuilder
    private func Person() -> some View {
        ZStack {
            Text("🌸")
                .offset(x: -80, y: isSmell ? -50 : 0)
                .opacity(isSmell ? 0 : 0.8)
            Text("🌼")
                .offset(x: -100, y: isSmell ? -110 : 0)
                .opacity(isSmell ? 0 : 0.8)
            Text("🌸")
                .offset(x: 80, y: isSmell ? -120 : 0)
                .opacity(isSmell ? 0 : 0.8)
            Text("🌼")
                .offset(x: 100, y: isSmell ? -80 : 0)
                .opacity(isSmell ? 0 : 0.8)

            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)

        }
    }
}

