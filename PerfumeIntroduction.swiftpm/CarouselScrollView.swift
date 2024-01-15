//
//  CarouselScrollView.swift
//  PerfumeIntroduction
//
//  Created by yimkeul on 1/14/24.
//

import SwiftUI

struct CarouselScrollView: View {
    @State private var currentIndex: Int = 0
    @GestureState private var dragOffset: CGFloat = 0
    
    // FIXME: 수정해야함.
    private let images: [String] = ["perfume1", "perfume2", "perfume3", "perfume4"]
    
    var body: some View {
            ZStack {
//                Rope().offset(y:CGFloat(-500))
                ForEach(0..<images.count, id: \.self) { index in
                    VStack{
                        Text(images[currentIndex])

                        CardView()
                            .scaleEffect(currentIndex == index ? 1.0: 0.8)
                            .offset(
                                x: CGFloat(index - currentIndex) * 300 + dragOffset,
                                y: currentIndex == index ? 0 : CGFloat(abs(currentIndex - index) * -80))
                            .onTapGesture {
                                // TODO: Set NavigationLink
                            }
                    }
                }
                .gesture(
                    DragGesture()
                        .onEnded({ value in
                            let threshold: CGFloat = 10
                            if value.translation.width > threshold {
                                withAnimation {
                                    currentIndex = max(0, currentIndex - 1)
                                }
                            } else if value.translation.width < -threshold {
                                withAnimation {
                                    currentIndex = min(images.count - 1, currentIndex + 1)
                                }
                            }
                        })
                )
                
            }.ignoresSafeArea()
    }
    
    @ViewBuilder
    func Rope() -> some View {
                Ellipse()
                    .trim(from: 0, to: 0.5)
                    .stroke(Color.Rope, style: StrokeStyle(
                        lineWidth: 30, lineCap: .round, dash: [20]
                    ))
                    .frame(width: 1366, height: 500)
    }
}


#Preview {
    CarouselScrollView()
}


