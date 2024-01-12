import SwiftUI

struct ContentView: View {
//    @State var showOnboardingView: Bool = true
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
        }
        .fullScreenCover(isPresented: $isOnboarding, content: {
            OnBoardTabView(showOnboardingView: $isOnboarding)
        })
    }
}
