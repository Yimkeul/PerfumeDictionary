//
//  CardView.swift
//  PerfumeIntroduction
//
//  Created by yimkeul on 1/15/24.
//

import SwiftUI


struct CardFront: View {
    let Title: String
    let Desc: String

    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(Color.black)
                .frame(width: 250, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
            Rectangle()
                .fill(Color.black)
                .frame(width: 100, height: 50)
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 300, height: 500)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                    .shadow(radius: 5, y: 10)
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 250, height: 450)
                    .overlay(Rectangle().stroke(Color.black, lineWidth: 5))

                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 225, height: 425)
                        .overlay(Rectangle().stroke(Color.black, lineWidth: 2))
                    VStack(alignment: .leading) {
                        HStack {
                            Text(Title)
                                .font(.system(size: 50, weight: .light))
                            Spacer()
                        }.padding(.bottom, 20)
                        Text(Desc)
                            .font(.system(size: 20, weight: .thin))
                        Spacer()
                    }
                    .foregroundStyle(.black)
                    .padding()
                    .frame(width: 225, height: 425)
                }
                


            }
        }
            .fixedSize()
            .background(Color.clear)

    }

    @ViewBuilder
    private func line(_ top: CGFloat, _ left: CGFloat) -> some View {
        ZStack {
            Path { path in
                path.move(to: CGPoint(x: top, y: 105))
                path.addLine(to: CGPoint(x: 5, y: left))
                path.closeSubpath()
            }
                .stroke(.black, style: StrokeStyle(lineWidth: 10, lineJoin: .round))

            Path { path in
                path.move(to: CGPoint(x: top + 30, y: 105))
                path.addLine(to: CGPoint(x: 5, y: left + 50))
                path.closeSubpath()
            }
                .stroke(.black, style: StrokeStyle(lineWidth: 10, lineJoin: .round))

            Path { path in
                path.move(to: CGPoint(x: top + 60, y: 105))
                path.addLine(to: CGPoint(x: 5, y: left + 100))
                path.closeSubpath()
            }.stroke(.black, style: StrokeStyle(lineWidth: 10, lineJoin: .round))
        }
    }
}


#Preview {
    CardFront(Title: "Test", Desc: "TTTT")
}
