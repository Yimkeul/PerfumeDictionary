import SwiftUI

struct ContentView: View {
    @State private var isOnboard: Bool = true
    var body: some View {


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
