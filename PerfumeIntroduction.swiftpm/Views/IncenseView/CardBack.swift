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
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 345)
                .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                .shadow(radius: 5, y: 10)
        }
            .fixedSize()
            .background(Color.clear)
    }
}

#Preview {
    CardBack(image: "a", title: "B")
}
