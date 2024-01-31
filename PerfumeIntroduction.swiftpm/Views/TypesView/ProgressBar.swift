//
//  RoundedRectProgressViewStyle.swift
//
//
//  Created by yimkeul on 2/1/24.
//

import SwiftUI

struct RoundedRectProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader {
            geo in
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.Disable)
                .frame(width: 30, height: 420)

            RoundedRectangle(cornerRadius: 14)
                .fill(Color.Water)
                .frame(width: 30, height: CGFloat(configuration.fractionCompleted ?? 0) * 420)
        }
            .frame(width: 30)
            .rotationEffect(Angle(degrees: 180))

    }
}
