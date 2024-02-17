import SwiftUI

struct ContentView: View {
    @State private var isOnboard: Bool = true
    @State private var selection: MenuType?
    private var size = UIScreen.main.bounds.size

    var body: some View {
        NavigationSplitView {
                    List(selection: $selection) {
                            ForEach(MenuData) { index in
                                NavigationLink(value: index.type) {
                                    Sidebar(title: index.title, desc: index.desc, image: index.image)
                                }
                            }
                    }.overlay(
                        VStack {
                            Spacer()
                            Text("Icons by Icons8")
                                .foregroundColor(.Disable)
                                .padding()
                        }
                    )
                        .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button {
                                selection = nil
                            } label: {
                                Text("Perfume Introduction")
                                    .foregroundStyle(Color.BG)
                                    .font(.system(size: 20, weight: .bold))
                            }
                        }
                    }
        } detail: {
            if let focus = selection {
                MenuType.view(focus)
            } else {
                ZStack {
                    Image("BGImg")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                    Image("Intro")
                        .imageScale(.large)
                    VStack {
                        Spacer()
                        Text("Image by rawpixel.com(Perfume), kues1(background), Freepik(floral background) on Freepik")
                            .foregroundColor(.Disable)
                            .padding()
                    }
                }
            }
        }
            .fullScreenCover(isPresented: $isOnboard, content: {
            OnboardingView(isOnboard: $isOnboard)
        })
    }
}


