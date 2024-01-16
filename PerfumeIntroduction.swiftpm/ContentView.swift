import SwiftUI

struct ContentView: View {
    @State private var isOnboard: Bool = false
    var body: some View {


        NavigationStack {
            ZStack {
                Image("BGImg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.container, edges: .bottom)
                CarouselScrollView()
            }
                .fullScreenCover(isPresented: $isOnboard, content: {
                OnboardingView(isOnboard: $isOnboard)
            })
        }
    }
}
