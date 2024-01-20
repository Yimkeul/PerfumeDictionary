//
//  GenderView.swift
//
//
//  Created by yimkeul on 1/20/24.
//

import SwiftUI

enum appearType {
    case man
    case woman
    case none
}

struct GenderView: View {
    @State private var isLeft: Bool = true
    @State private var isAppear: appearType = .none

    init(isLeft: Bool, isAppear: appearType) {
        self._isLeft = State(initialValue: isLeft)
        self.isAppear = isAppear
    }

    var body: some View {
        VStack {
            Spacer()
            Text("Gender-specific perfume terminology")
            Text("The following words can be placed in the middle of a perfume name")
            Spacer()

            if isAppear == .man {
                mentBalloon(isLeft: true)
            } else if isAppear == .woman {
                mentBalloon(isLeft: false)
            } else {
                // emptyView
                Rectangle().frame(height: 100).opacity(0)
            }
            HStack {
                Spacer()
                    
                Button {
                    isAppear = .man
                } label: {
                    VStack {
                        Text("💁‍♂️")
                            .font(.system(size: 100, weight: .bold))
                    }
                }
                Spacer()
                    .frame(maxWidth: 600)
                Button {
                    isAppear = .woman
                } label: {
                    VStack {
                        Text("💁‍♀️")
                            .font(.system(size: 100, weight: .bold))
                    }
                }
                Spacer()
            }
            Spacer()
            Text("Recently, there have been a lot of neutral scents, so the above words may not exist.")
            Spacer()
        }
    }

    @ViewBuilder
    func mentBalloon(isLeft: Bool) -> some View {
        ZStack {
            Rectangle()
                .fill(.pink)
                .frame(width: 40, height: 30)
                .rotationEffect(Angle(degrees: 90))
                .offset(x: isLeft ? -285 : 285, y: 25)
            Capsule()
                .frame(width: 600, height: 100)
            if isLeft {
                Text("is Man")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            } else {
                Text("is Woman")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
            Button {
                isAppear = .none
                print("click")
            } label: {
                Text("X")
                    .font(.system(size: 30))
                    .foregroundColor(.red)
                    .background(.green)
            }.offset(x: 270, y: -25)
        }
    }
}

#Preview {
    GenderView(isLeft: true, isAppear: .none)
}

