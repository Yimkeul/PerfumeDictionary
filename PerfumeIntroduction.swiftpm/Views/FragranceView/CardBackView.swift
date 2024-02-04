//
//  CardBackView.swift
//
//
//  Created by yimkeul on 2/4/24.
//

import SwiftUI

struct CardBackView: View {
    let test: String
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
                    
                    Image("Intro")
                        .frame(width: 300, height: 500)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                    Text(test)
                        .bold()
                }
                    .shadow(radius: 5, y: 10)
        }.fixedSize()
            .background(Color.clear)
    }
}

#Preview {
    CardBackView(test: "a")
}
