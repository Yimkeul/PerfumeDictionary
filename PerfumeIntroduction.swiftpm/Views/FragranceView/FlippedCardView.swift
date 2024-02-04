//
//  FlippedCardView.swift
//
//
//  Created by yimkeul on 2/4/24.
//

import SwiftUI

struct FlippedCardView: View {
    @Binding var isFlipped: Bool
    let title: String
    let desc: String
    let num: String
    var body: some View {
        ZStack {
            CardBackView(test: num)
                .rotation3DEffect(
                    .degrees(isFlipped ? 0 : -90),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
                .animation(isFlipped ? .linear.delay(0.35): .linear , value: isFlipped)
            
            CardView(Title: title, Desc: desc)
                .rotation3DEffect(
                    .degrees(isFlipped ? 90 : 0),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
                .animation(isFlipped ? .linear : .linear.delay(0.35), value: isFlipped)
            
        }
        .onTapGesture {
            withAnimation(.easeIn){
                isFlipped.toggle()
            }
        }
        
    }
}

