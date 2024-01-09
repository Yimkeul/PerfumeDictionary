//
//  OnboardingView.swift
//  PerfumeDictonary
//
//  Created by yimkeul on 1/4/24.
//

import SwiftUI

struct OnBoardTabView: View {
    @Binding var showOnboardingView: Bool
    var body: some View {
        TabView() {
            TestFirstView()
            OnBoardView(title: "First", showsDismissButton: false, showOnboardingView: $showOnboardingView)
            OnBoardView(title: "Second", showsDismissButton: true, showOnboardingView: $showOnboardingView)
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}
