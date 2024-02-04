//
//  FragranceView.swift
//
//
//  Created by yimkeul on 1/21/24.
//

import SwiftUI

struct FragranceView: View {
    @State private var currentIndex: Int = 0
    @State private var isFlipped: [Bool] = [false, false, false, false, false, false, false]
    @GestureState private var dragOffset: CGFloat = 0
    var body: some View {
        ZStack {
            ForEach(0..<Cards.count, id: \.self) { index in
                FlippedCardView(isFlipped: $isFlipped[index], title: Cards[index].Title, desc: Cards[index].Desc, num: String(index + 1))
                    .scaleEffect(currentIndex == index ? 1.0 : 0.8)
                    .offset(
                    x: CGFloat(index - currentIndex) * 300 + dragOffset,
                    y: currentIndex == index ? 0 : CGFloat(abs(currentIndex - index) * -80))
                    .onTapGesture {
                        if currentIndex == index {
                            withAnimation(.easeIn) {
                                isFlipped[index].toggle()
                            }
                        }
                    }
            }
            .gesture(
            DragGesture()
                .onEnded({ value in
                let threshold: CGFloat = 1
                if value.translation.width > threshold {
                    withAnimation {
                        currentIndex = max(0, currentIndex - 1)
                        isFlipped = Array(repeating: false, count: isFlipped.count)
                    }
                } else if value.translation.width < -threshold {
                    withAnimation {
                        currentIndex = min(Cards.count - 1, currentIndex + 1)
                        isFlipped = Array(repeating: false, count: isFlipped.count)
                    }
                }
            })
        )
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
           .navigationBarTitleDisplayMode(.inline)
           .background(
           Image("BGImg")
               .resizable()
               .scaledToFill()
               .ignoresSafeArea()
       )
        
        
            
    }
}

#Preview {
    FragranceView()
}
