//
//  Sidebar.swift
//
//
//  Created by yimkeul on 1/20/24.
//

import SwiftUI

struct Sidebar: View {
    let title: String
    let desc: String
    let image: String
    
    var body: some View {
        HStack {
            Image(image)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 50,height: 50)
                .padding(.trailing, 8)
            VStack(alignment: .leading, spacing: 0) {
                Text(title)
                    .font(Font.system(size: 20.0, weight: .semibold))
                    .padding(.bottom, 4)
                Text(desc)
                    .font(.body)
                    .foregroundColor(.gray)
            }
        }
            .frame(minHeight: 60)
    }
}
