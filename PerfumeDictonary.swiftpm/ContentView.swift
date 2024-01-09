import SwiftUI

struct ContentView: View {
    @State var showOnboardingView: Bool = true
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
        }
        .fullScreenCover(isPresented: $showOnboardingView, content: {
            OnBoardTabView(showOnboardingView: $showOnboardingView)
        })
    }
}
