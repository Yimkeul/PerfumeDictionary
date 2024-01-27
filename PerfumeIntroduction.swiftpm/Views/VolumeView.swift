//
//  PerfumeView.swift
//
//
//  Created by yimkeul on 1/21/24.
//

import SwiftUI

struct VolumeView: View {
    var body: some View {
        VStack{
            Image("Spoid")
            Image("Beaker")
                .resizable()
                .frame(width: 350, height: 350)
                .scaledToFit()
        }
        
    }
}

#Preview {
    VolumeView()
}
