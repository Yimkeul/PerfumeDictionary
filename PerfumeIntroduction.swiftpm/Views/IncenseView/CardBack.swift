//
//  CardBackView.swift
//
//
//  Created by yimkeul on 2/4/24.
//

import SwiftUI

struct CardBack: View {
    let image: String
    let title: String
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(Color.black)
                .frame(width: 75, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 8.0, style: .continuous))
                .offset(y : 8)
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 300, height: 345)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                    .shadow(radius: 5, y: 10)

                ZStack {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 345)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                    VStack {
                        Spacer()
                        HStack{
                            Text(title)
                                .foregroundStyle(.black)
                            Spacer()
                        }.padding()
                    }
                        .frame(width: 300, height: 345)
                }
            }
        }
            .fixedSize()
            .background(Color.clear)
    }
}

#Preview {
    CardBack(image: "a", title: "B")
}
