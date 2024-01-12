//
//  OnboardingView.swift
//  PerfumeDictonary
//
//  Created by yimkeul on 1/4/24.
//

import SwiftUI

struct OnBoardTabView: View {
    @Binding var showOnboardingView: Bool

    @State var pageIndex = 0
    @State private var showAnimation3: Bool = false
    
    var body: some View {
        TabView(selection: $pageIndex) {
            FirstTabView().tag(0)
            SecondTabView().tag(1)
            ThridTabView(showOnboardingView: $showOnboardingView, showAnimation3: $showAnimation3).tag(2)
        }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .onChange(of: pageIndex) { newValue in
            if newValue == 2 {
                showAnimation3 = true
            }
        }
    }
}
