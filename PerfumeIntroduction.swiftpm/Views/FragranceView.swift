//
//  FragranceView.swift
//
//
//  Created by yimkeul on 1/21/24.
//

import SwiftUI

struct FragranceView: View {
    var body: some View {
        ZStack {
            CarouselScrollView2()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarTitleDisplayMode(.inline)
        .background(
        Image("BGImg")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    )
        
    }
}

#Preview {
    FragranceView()
}
