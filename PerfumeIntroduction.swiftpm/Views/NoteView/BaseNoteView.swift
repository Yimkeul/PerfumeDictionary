//
//  SwiftUIView.swift
//
//
//  Created by yimkeul on 1/27/24.
//

import SwiftUI

struct BaseNoteView: View {

    @Binding var isActive: Bool
    var isType: noteType

    @State var isFeel: Bool = true
    @State var isWind: Bool = false
    @State var isAnimation: Bool = false

    var body: some View {

        VStack {
            Image(systemName: "person.3.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .offset(y : 30)
            
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
        }  .frame(height: 270)
            .onAppear() {
            withAnimation(.linear(duration: 1)
                .repeatForever(autoreverses: true)) {
                isAnimation = true
            }
            isActive = false
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

