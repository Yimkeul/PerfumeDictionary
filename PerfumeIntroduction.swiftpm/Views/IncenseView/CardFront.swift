//
//  CardView.swift
//  PerfumeIntroduction
//
//  Created by yimkeul on 1/15/24.
//

import SwiftUI


struct CardFront: View {
    let title: String
    let desc: String

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
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 250, height: 300)
                    .overlay(Rectangle().stroke(Color.black, lineWidth: 5))

                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 230, height: 280)
                        .overlay(Rectangle().stroke(Color.black, lineWidth: 2))
                    VStack(alignment: .leading) {
                        HStack {
                            Text(title)
                                .font(.system(size: 50, weight: .light))
                            Spacer()
                        }.padding(.bottom, 20)
                        Text(desc)
                            .font(.system(size: 20, weight: .thin))
                        Spacer()
                    }
                    .foregroundStyle(.black)
                    .padding()
                    .frame(width: 230, height: 280)
                }
            }
        }
            .fixedSize()
            .background(Color.clear)

    }
}


#Preview {
    CardFront(title: "Test", desc: "TTTT")
}
