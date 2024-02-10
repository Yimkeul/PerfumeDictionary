//
//  RoundedRectProgressViewStyle.swift
//
//
//  Created by yimkeul on 2/1/24.
//

import SwiftUI

struct RoundedRectProgressViewStyle: ProgressViewStyle {
    @Binding var value: Int
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader {
            geo in
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.Disable)
                .frame(width: 30, height: 420)

            RoundedRectangle(cornerRadius: 14)
                .fill(
                (0...2).contains(value) ? Color.white:
                    (3...4).contains(value) ? Color.Water1:
                    (5...7).contains(value) ? Color.Water2:
                    (8...15).contains(value) ? Color.Water3:
                    Color.Water4
            )
                .frame(width: 30, height: CGFloat(configuration.fractionCompleted ?? 0) * 420)
        }
            .frame(width: 30)
            .rotationEffect(Angle(degrees: 180))

    }
}




