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
    @State var isFeel: Bool = true

    @State var isW: CGFloat = UIScreen.main.bounds.width
    @State var isH: CGFloat = UIScreen.main.bounds.height
    @State var isS: CGFloat = 0

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Group {
                    Text("Changes or stages of fragrance over time")
                        .font(.system(.title, weight: .bold))
                        .padding(.bottom, 16)
                    Text("Typically categorized into Top, Middle, and Base.")
                        .font(.title2)
                    Text("Shall we explore the fragrance together by clicking on it?")
                        .font(.title2)
                }
                    .foregroundStyle(.black)
                Spacer().frame(maxHeight: 120)
                HStack {
                    Spacer()
                    Perfume(isAnimation: $isAnimation, isWind: $isWind, isFeel: $isFeel)
                    Spacer()
                    Head(isFeel: isFeel)
                    Spacer()
                }
                Spacer()
            }
                .padding()
                .frame(width: isS)

            if isActive {
                NoteDialog(isActive: $isActive, isS: $isS)
            }
        }
            .onAppear() {
            withAnimation(.linear(duration: 1)
                .repeatForever(autoreverses: true)) {
                isAnimation = true
            }
            isActive = false
            isS = min(isW, isH)
        }
            .onChange(of: UIScreen.main.bounds.size) { _ in
            isW = UIScreen.main.bounds.width
            isH = UIScreen.main.bounds.height
            isS = min(isW, isH)
        }
    }

    @ViewBuilder
    private func Head(isFeel: Bool) -> some View {
        ZStack {
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 270, height: 270)

            ZStack {
                Image(systemName: "exclamationmark.bubble")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .foregroundColor(.yellow)
            }
                .offset(x: 50, y: -120)
                .opacity(isFeel ? 1 : 0)
                .scaleEffect(isFeel ? 1.5 : 0)
                .onTapGesture {
                isActive = true
            }
        }
    }
}

#Preview {
    NoteView()
}
