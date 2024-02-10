//
//  FragranceView.swift
//
//
//  Created by yimkeul on 1/21/24.
//

import SwiftUI

struct IncenseView: View {
    @State private var currentIndex: Int = 0
    @State private var isFlipped: [Bool] = Array(repeating: false, count: 19)
    @GestureState private var dragOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            VStack {
                Group {
                    Text("Incense Types")
                        .font(.system(.title, weight: .bold))
                        .padding(.bottom, 16)
                    Text("Try imagining a scent based on the image.")
                        .font(.title2)
                    Text("✨Swipe! And Flip Card✨")
                        .font(.system(size: 20, weight: .semibold))
                        .padding(.top, 8)
                }
                    .foregroundStyle(.black)

                Spacer()
                FilppedCards()
                Spacer()
            }.padding()
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
    
    @ViewBuilder
    private func FilppedCards() -> some View {
        ZStack {
            ForEach(0..<CardContents.count, id: \.self) { index in
                CardView(isFlipped: $isFlipped[index], title: CardContents[index].Title, desc: CardContents[index].Desc, image: CardContents[index].Image)
                    .scaleEffect(currentIndex == index ? 1.0 : 0.8)
                    .offset(
                        x: CGFloat(index - currentIndex) * 300 + dragOffset, y: 0
                    /*y: currentIndex == index ? 0 : CGFloat(abs(currentIndex - index) * -40)*/)
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
                        currentIndex = min(CardContents.count - 1, currentIndex + 1)
                        isFlipped = Array(repeating: false, count: isFlipped.count)
                    }
                }
            })
        )
        }.frame(height: 300)
    }
}

#Preview {
    IncenseView()
}
