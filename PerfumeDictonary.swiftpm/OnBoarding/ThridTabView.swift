//
//  SwiftUIView.swift
//  
//
//  Created by yimkeul on 1/12/24.
//

import SwiftUI

struct ThridTabView: View {
    @Binding var showOnboardingView: Bool
    @Binding var showAnimation3: Bool
    @State private var showAnimation: Bool = false
    
    var body: some View {
        VStack {
            Text("Are you curious?")
                .font(.system(size: 50, weight: .bold))
            Button {
                showOnboardingView.toggle()
            } label: {
                Text("CLICK ME!!")
            }
            .offset(y: showAnimation3 ? 0 : 10)
            .opacity(showAnimation3 ? 1 : 0)
            .animation(.easeInOut(duration: 1).delay(1), value: showAnimation3)
        }
    }
}

