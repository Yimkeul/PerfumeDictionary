//
//  OnboardingView.swift
//  PerfumeDictonary
//
//  Created by yimkeul on 1/4/24.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var showOnboardingView: Bool
    var body: some View {
        TabView() {
            OnboardView(title: "First", showsDismissButton: false, showOnboardingView: $showOnboardingView)
            OnboardView(title: "Second", showsDismissButton: true, showOnboardingView: $showOnboardingView)
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}


struct OnboardView: View {
    let title: String
    let showsDismissButton: Bool
    @Binding var showOnboardingView: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.title)
                .bold()
            if showsDismissButton {
                Button {
                    showOnboardingView.toggle()
                } label: {
                    Text("Get Started")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(.green)
                        .cornerRadius(6)
                }
            }
        }
        .padding(.horizontal, 20)
    }
}


