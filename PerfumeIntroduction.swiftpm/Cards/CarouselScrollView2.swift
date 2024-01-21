//
//  CarouselScrollView2.swift
//
//
//  Created by yimkeul on 1/21/24.
//

import SwiftUI

struct CarouselScrollView2: View {
    @State private var currentIndex: Int = 0
    @State private var isTap: Bool = false
    @GestureState private var dragOffset: CGFloat = 0

    func testing2(_ currentIndex: Int) {
        print("tap : \(currentIndex)")
    }

    var body: some View {
        NavigationStack {
            ZStack {
                ForEach(0..<Cards.count, id: \.self) { index in

                    CardView(Title: Cards[index].Title, Desc: Cards[index].Desc)
                        .scaleEffect(currentIndex == index ? 1.0 : 0.8)
                        .offset(
                        x: CGFloat(index - currentIndex) * 300 + dragOffset,
                        y: currentIndex == index ? 0 : CGFloat(abs(currentIndex - index) * -80)
                    ).frame(maxWidth: .infinity,maxHeight: .infinity)
                        .onTapGesture {
                        if currentIndex == index {
                            isTap.toggle()
                        }
                    }
                }.gesture(
                    DragGesture()
                        .onEnded({ value in
                        let threshold: CGFloat = 1
                        if value.translation.width > threshold {
                            withAnimation {
                                currentIndex = max(0, currentIndex - 1)
                            }
                        } else if value.translation.width < -threshold {
                            withAnimation {
                                currentIndex = min(Cards.count - 1, currentIndex + 1)
                            }
                        }
                    })
                )
                    .navigationDestination(isPresented: $isTap) {
                    Destination.view(Cards[currentIndex].Nav)
                }
            }
        }
    }
}


//ZStack {
//    ForEach(0..<Cards.count, id: \.self) { index in
//        CardView(Title: Cards[index].Title, Desc: Cards[index].Desc)
//            .scaleEffect(currentIndex == index ? 1.0 : 0.8)
//            .offset(
//            x: CGFloat(index - currentIndex) * 300 + dragOffset,
//            y: currentIndex == index ? 0 : CGFloat(abs(currentIndex - index) * -80)
//        ).onTapGesture {
//            if currentIndex == index {
//                isTap.toggle()
//            }
//        }
//            .navigationDestination(isPresented: $isTap) {
//            Destination.view(Cards[currentIndex].Nav)
//        }
//    }
//        .gesture(
//        DragGesture()
//            .onEnded({ value in
//            let threshold: CGFloat = 1
//            if value.translation.width > threshold {
//                withAnimation {
//                    currentIndex = max(0, currentIndex - 1)
//                }
//            } else if value.translation.width < -threshold {
//                withAnimation {
//                    currentIndex = min(Cards.count - 1, currentIndex + 1)
//                }
//            }
//        })
//    )
//}
//.edgesIgnoringSafeArea(.horizontal)
//.onTapGesture {
//    if currentIndex == index {
//        isTap.toggle()
//    }
//}
//    .navigationDestination(isPresented: $isTap) {
//    Destination.view(Cards[currentIndex].Nav)
//}
