import SwiftUI

struct TestFirstView: View {
    @State private var showAnimation: Bool = false
    @State private var top: CGFloat = -500
    @State private var rotation: Angle = .degrees(0)
    
    struct bgEffect: Hashable {
        let xPos: CGFloat
        let yPos: CGFloat
        let rotate: Angle
    }
    
    @State var items: [bgEffect] =
    [
        bgEffect(xPos: -300, yPos: 500, rotate: .degrees(10)),
        bgEffect(xPos: -250, yPos: 500, rotate: .degrees(30)),
        bgEffect(xPos: -100, yPos: 500, rotate: .degrees(50)),
        bgEffect(xPos: 0, yPos: 400, rotate: .degrees(90)),
        bgEffect(xPos: 100, yPos: 300, rotate: .degrees(130)),
        bgEffect(xPos: 250, yPos: 200, rotate: .degrees(110)),
        bgEffect(xPos: 300, yPos: 100, rotate: .degrees(180))
    ]
    
    var body: some View {
        ZStack {
            Color.gray
            
            ForEach(items, id: \.self) {
                item in
                Image(systemName: "drop.halffull")
                    .font(.system(size: 100, weight: .bold))
                    .rotationEffect(showAnimation ? item.rotate : .degrees(0))
                    .offset(x: item.xPos, y: showAnimation ?  item.yPos : -500)
                    .animation(
                        .easeInOut(duration: 3)
                        , value: showAnimation)
                    .onAppear() {
                        showAnimation = true
                    }
            }
        }
    }
}
