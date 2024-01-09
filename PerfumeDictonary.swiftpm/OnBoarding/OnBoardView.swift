import SwiftUI

struct OnBoardView: View {
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


