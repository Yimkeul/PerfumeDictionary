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
    @State var isFeel: Bool = false

    var body: some View {

            VStack {
                Spacer()
                Group {
                    Text("Note represents the changes or stages of fragrance over time")
                    Text("Typically categorized into Top, Mid, and Base.\nShall we explore the fragrance together by clicking on it?")
                        .multilineTextAlignment(.center)
                }
                .foregroundStyle(.black)
                Spacer()
                HStack {
                    Perfume(isAnimation: $isAnimation, isWind: $isWind, isFeel: $isFeel).background(.green)
//                    Spacer().frame(maxWidth: 100)
                    Spacer()
                    Head(isFeel: isFeel).background(.green)
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

    @ViewBuilder
    private func Head(isFeel: Bool) -> some View {
        ZStack {
            Image("Person")
                .resizable()
                .scaledToFit()
                .frame(width: 270, height: 270)
            
            ZStack {
                Rectangle()
                    .fill(.pink)
                    .frame(width: 30, height: 40)
                    .rotationEffect(Angle(degrees: 45))
                    .offset(x: 20, y: 15)
                
                Ellipse()
                    .fill(.pink)
                    .frame(width: 100, height: 60)
                    
                Image("Exclamation")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .foregroundColor(.yellow)
            }
                .offset(x: 50, y: -110)
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
