import SwiftUI

struct ContentView: View {
    @State private var isOnboard: Bool = true
    var body: some View {
        VStack {
            Text("Hello")
        }
            .fullScreenCover(isPresented: $isOnboard, content: {
            OnboardingView(isOnboard: $isOnboard)
        })
    }
}
