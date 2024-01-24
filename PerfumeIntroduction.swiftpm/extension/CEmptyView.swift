//
//  SwiftUIView.swift
//  
//
//  Created by yimkeul on 1/24/24.
//

import SwiftUI

struct CEmptyView: View {
    let width: CGFloat
    let height: CGFloat
    var body: some View {
        Rectangle()
            .fill(.clear)
            .frame(width: width, height: height)
    }
}

