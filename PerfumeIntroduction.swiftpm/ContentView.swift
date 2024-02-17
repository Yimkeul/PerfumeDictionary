import SwiftUI

struct ContentView: View {
    // 온보딩용 변수 (true여야 온보딩이 시작함)
    @State private var isOnboard: Bool = true
    // 네비게이션 변수
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
                                .foregroundColor(.Disable) // 텍스트의 색상 설정
                                .padding() // 텍스트 주변의 여백 추가
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
                }
            }
        }
            .fullScreenCover(isPresented: $isOnboard, content: {
            OnboardingView(isOnboard: $isOnboard)
        })
    }
}


