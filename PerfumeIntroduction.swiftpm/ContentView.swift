import SwiftUI

struct ContentView: View {
    // 온보딩용 변수 (true여야 온보딩이 시작함)
    @State private var isOnboard: Bool = false
    // 네비게이션 변수
    @State private var selection: MenuType?

    var body: some View {
        NavigationSplitView {
            List(selection: $selection) {
                ForEach(MenuData) { index in
                    NavigationLink(value: index.type) {
                        Sidebar(title: index.title, desc: index.desc, image: index.image)
                    }
                }
            }
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
                ZStack {
                    Image("BGImg")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                    MenuType.view(focus)
                }
            } else {
                ZStack {
                    Image("BGImg")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                    Image("Intro")
                        .imageScale(.large)
                }
            }
        }
            .fullScreenCover(isPresented: $isOnboard, content: {
            OnboardingView(isOnboard: $isOnboard)
        })
    }
}


